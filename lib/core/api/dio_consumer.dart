import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:things_todo/core/api/logging_interceptor.dart';
import 'package:things_todo/core/resources/strings_manager.dart';
import 'package:things_todo/injection.dart';

import 'api_consumer.dart';
import 'end_points.dart';
@Singleton(as: ApiConsumer)
class DioConsumer implements ApiConsumer {
  final Dio client;
  late Map<String, String> _headers;

  DioConsumer({required this.client}) {
    client.options
      ..sendTimeout = 10 * 100000
      ..connectTimeout = 60 * 100000
      ..receiveTimeout = 30 * 100000
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = true;
    if (kDebugMode) {
      client.interceptors.add(getIt<LoggingInterceptor>());
    }
  
  }

  void setHeaders() {
    _headers = {
      StringsManager.accept: StringsManager.applicationJson,
      StringsManager.contentType: StringsManager.applicationJson,
      StringsManager.authorization:
          StringsManager.bearer ,
      
    };
  }

  @override
  Future get(String path,
      {Map<String, dynamic>? queryParameters, CancelToken? cancelToken}) async {
    setHeaders();

    try {
      final response = await client.get(
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
  Future post(String path,
      {Map<String, dynamic>? body,
      FormData? formData,
      Map<String, dynamic>? queryParameters}) async {
    setHeaders();

    try {
      final response = await client.post(path,
          queryParameters: queryParameters,
          options: Options(
              headers: _headers,
              contentType:
                  formData == null ? StringsManager.jsonContentType : null),
          data: formData ?? body);
      return _handleOnlineResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    setHeaders();
    try {
      final response = await client.put(
        path,
        queryParameters: queryParameters,
        data: body,
        options:
            Options(headers: _headers, contentType: StringsManager.jsonContentType),
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
