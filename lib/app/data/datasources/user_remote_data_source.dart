import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:things_todo/app/domain/bodies/login_body.dart';
import 'package:things_todo/app/domain/bodies/register_body.dart';
import 'package:things_todo/core/api/api_consumer.dart';
import 'package:things_todo/core/api/end_points.dart';
import 'package:things_todo/core/api_global_responses/api_success_response.dart';
import 'package:things_todo/app/data/models/user_model/user_model.dart';
import 'package:things_todo/app/domain/usecases/post_login_usecase.dart';

abstract class UserRemoteDataSource {
  Future<ApiSuccessResponse<UserModel>> login(LoginBody body);
  Future<ApiSuccessResponse<UserModel>> register(RegisterBody body);
}

@Singleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImp implements UserRemoteDataSource {
  UserRemoteDataSourceImp(this._apiConsumer);
  final ApiConsumer _apiConsumer;
  @override
  Future<ApiSuccessResponse<UserModel>> login(
    LoginBody body,
  ) async =>
      await _getResultsAndModelTheUser(
        () => _apiConsumer.post(
          EndPoints.login,
          formData: FormData.fromMap(
            body.toJson(),
          ),
        ),
      );
@override
  Future<ApiSuccessResponse<UserModel>> register(RegisterBody body)async =>
      await _getResultsAndModelTheUser(
        () => _apiConsumer.post(
          EndPoints.register,
          formData: FormData.fromMap(
            body.toJson(),
          ),
        ),
      );
  Future<ApiSuccessResponse<UserModel>> _getResultsAndModelTheUser(
    Future Function() apiCall,
  ) async {
    final response = await apiCall();
    return ApiSuccessResponse.fromJson(
      response,
      (json) => UserModel.fromJson(json),
    );
  }
  
  
}