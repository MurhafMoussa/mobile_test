import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:things_todo/core/api/api_consumer.dart';
import 'package:things_todo/core/api/end_points.dart';
import 'package:things_todo/core/api_global_responses/api_success_response.dart';
import 'package:things_todo/features/home/data/models/user_model/user_model.dart';
import 'package:things_todo/features/home/domain/usecases/post_login_usecase.dart';

abstract class UserRemoteDataSource {
  Future<ApiSuccessResponse<UserModel>> login(LoginBody body);
}

@Singleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImp implements UserRemoteDataSource {

  UserRemoteDataSourceImp(this._apiConsumer);
  final ApiConsumer _apiConsumer;
  @override
  Future<ApiSuccessResponse<UserModel>> login(LoginBody body) async {
    final response = await _apiConsumer.post(
      EndPoints.login,
      formData: FormData.fromMap(
        body.toMap(),
      ),
    );
    return ApiSuccessResponse.fromJson(
      response,
      (json) => UserModel.fromJson(json),
    );
  }
}
