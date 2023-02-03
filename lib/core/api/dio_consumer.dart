import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:things_todo/app/data/datasources/user_local_data_source.dart';
import 'package:things_todo/core/api/api_consumer.dart';
import 'package:things_todo/core/api/end_points.dart';
import 'package:things_todo/core/api/logging_interceptor.dart';
import 'package:things_todo/core/resources/strings_manager.dart';
import 'package:things_todo/injection.dart';

@Singleton(as: ApiConsumer)
class DioConsumer implements ApiConsumer {
  DioConsumer(this._client, this._userLocalDataSource) {
    _client.options
      ..sendTimeout = 10 * 100000
      ..connectTimeout = 60 * 100000
      ..receiveTimeout = 30 * 100000
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = true;
    if (kDebugMode) {
      _client.interceptors.add(getIt<LoggingInterceptor>());
    }
  }
  final Dio _client;
  final UserLocalDataSource _userLocalDataSource;
  late Map<String, String> _headers;

  Future<void> setHeaders() async {
    final user = await _userLocalDataSource.getUser();

    _headers = {
      StringsManager.accept: StringsManager.applicationJson,
      StringsManager.contentType: StringsManager.applicationJson,
      StringsManager.authorization:
          user != null ? StringsManager.bearer + user.token! : '',
    };
  }

  @override
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    setHeaders();

    try {
      final Response response = await _client.get(
        path,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: Options(
          headers: _headers,
        ),
      );
      return _handleOnlineResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future post(
    String path, {
    Map<String, dynamic>? body,
    String? token,
    FormData? formData,
    Map<String, dynamic>? queryParameters,
  }) async {
    await setHeaders();

    try {
      final Response response = await _client.post(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: _headers,
          contentType: formData == null ? StringsManager.jsonContentType : null,
        ),
        data: formData ?? body,
      );
      return _handleOnlineResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future put(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    setHeaders();
    try {
      final Response response = await _client.put(
        path,
        queryParameters: queryParameters,
        data: body,
        options: Options(
          headers: _headers,
          contentType: StringsManager.jsonContentType,
        ),
      );
      return _handleOnlineResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future delete(String path) {
    throw UnimplementedError();
  }

  dynamic _handleOnlineResponseAsJson(Response response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }
}
