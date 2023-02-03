import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:things_todo/app/data/datasources/user_local_data_source.dart';
import 'package:things_todo/app/data/models/user_model/user_model.dart';
import 'package:things_todo/app/domain/bodies/change_password_body.dart';
import 'package:things_todo/app/domain/bodies/login_body.dart';
import 'package:things_todo/app/domain/bodies/register_body.dart';
import 'package:things_todo/app/domain/entities/user.dart';
import 'package:things_todo/core/api/api_consumer.dart';
import 'package:things_todo/core/api/end_points.dart';
import 'package:things_todo/core/api_global_responses/api_success_response.dart';
import 'package:things_todo/injection.dart';

abstract class UserRemoteDataSource {
  Future<ApiSuccessResponse<UserModel>> login(LoginBody body);
  Future<ApiSuccessResponse<UserModel>> register(RegisterBody body);
  Future<ApiSuccessResponse<void>> changePassword(
    ChangePasswordBody body,
  );
  Future<ApiSuccessResponse<UserModel>> updateUser(
    UserModel body,
  );
  Future<ApiSuccessResponse<void>> deleteAccount();
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
  Future<ApiSuccessResponse<UserModel>> register(RegisterBody body) async =>
      await _getResultsAndModelTheUser(
        () => _apiConsumer.post(
          EndPoints.register,
          formData: FormData.fromMap(
            body.toJson(),
          ),
        ),
      );
  @override
  Future<ApiSuccessResponse<void>> changePassword(
    ChangePasswordBody body,
  ) async =>
      await _getResults(
        () => _apiConsumer.post(
          EndPoints.changePassword,
          formData: FormData.fromMap(
            body.toJson(),
          ),
        ),
      );
  @override
  Future<ApiSuccessResponse<void>> deleteAccount() async => await _getResults(
        () => _apiConsumer.delete(
          EndPoints.deleteAccount,
        ),
      );
  @override
  Future<ApiSuccessResponse<UserModel>> updateUser(
    UserModel body,
  ) async {
    final userToBeUpdated = await checkForChangedFieldsInTheSavedUser(body);
    return await _getResultsAndModelTheUser(
      () => _apiConsumer.post(
        EndPoints.updateUser,
        formData: FormData.fromMap(
          userToBeUpdated!,
        ),
      ),
    );
  }

  Future<Map<String, dynamic>?> checkForChangedFieldsInTheSavedUser(
    UserModel body,
  ) async {
    final savedUser = await getIt<UserLocalDataSource>().getUser();
    final userToBeUpdated = body.toJson();
    final jsonSavedUser = savedUser?.toJson();
    for (var element in userToBeUpdated.entries) {
      if (enteredFieldExistsInLocalStorage(jsonSavedUser, element)) {
        userToBeUpdated[element.key] = null;
      }
    }
    removePhoneIfCountryCodeIsRedundant(userToBeUpdated);
    return userToBeUpdated;
  }

  void removePhoneIfCountryCodeIsRedundant(
    Map<String, dynamic> userToBeUpdated,
  ) {
    if (userToBeUpdated['country_code'] == null &&
        userToBeUpdated['phone'] != null) {
      userToBeUpdated.remove('phone');
    }
  }

  bool enteredFieldExistsInLocalStorage(
    Map<String, dynamic>? jsonSavedUser,
    MapEntry<String, dynamic> element,
  ) =>
      jsonSavedUser != null && jsonSavedUser.containsValue(element.value);

  Future<ApiSuccessResponse<UserModel>> _getResultsAndModelTheUser(
    Future Function() apiCall,
  ) async {
    final response = await apiCall();
    return ApiSuccessResponse.fromJson(
      response,
      (json) => UserModel.fromJson(json),
    );
  }

  Future<ApiSuccessResponse<void>> _getResults(
    Future Function() apiCall,
  ) async {
    final response = await apiCall();
    return ApiSuccessResponse.fromJson(
      response,
      (json) => Unit,
    );
  }
}
