import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_success_response.freezed.dart';
part 'api_success_response.g.dart';

@Freezed(genericArgumentFactories: true)
class ApiSuccessResponse<T> with _$ApiSuccessResponse {
  factory ApiSuccessResponse({
    required String message,
    T? data,
  }) = _ApiSuccessResponse;

  factory ApiSuccessResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJson,
  ) =>
      _$ApiSuccessResponseFromJson(json, fromJson);
      
}
