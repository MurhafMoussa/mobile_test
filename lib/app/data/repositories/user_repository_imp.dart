import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:things_todo/app/data/datasources/user_local_data_source.dart';
import 'package:things_todo/app/data/datasources/user_remote_data_source.dart';
import 'package:things_todo/app/data/models/user_model/user_model.dart';
import 'package:things_todo/app/domain/bodies/login_body.dart';
import 'package:things_todo/app/domain/bodies/register_body.dart';
import 'package:things_todo/app/domain/repositories/user_repository.dart';
import 'package:things_todo/core/api_global_responses/api_success_response.dart';
import 'package:things_todo/core/errors/network_exceptions.dart';
import 'package:things_todo/core/network/netwok_info.dart';

@Singleton(as: UserRepository)
class UserRepositoryImp implements UserRepository {
  UserRepositoryImp(
    this._userRemoteDataSource,
    this._networkInfo,
    this._userLocalDataSource,
  );
  final UserRemoteDataSource _userRemoteDataSource;
  final UserLocalDataSource _userLocalDataSource;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<NetworkExceptions, String>> login(
    LoginBody body,
  ) async => await _getResultsAndSaveUser(
      () => _userRemoteDataSource.login(body),
    );

  @override
  Future<Either<NetworkExceptions, String>> register(
    RegisterBody registerBody,
  ) async => await _getResultsAndSaveUser(
      () => _userRemoteDataSource.register(registerBody),
    );

  Future<Either<NetworkExceptions, String>> _getResultsAndSaveUser(
    Future<ApiSuccessResponse<UserModel>> Function() apiCall,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final ApiSuccessResponse<UserModel> response = await apiCall();
        await _userLocalDataSource.saveUser(response.data);
        return Right(
          response.message,
        );
      } catch (exception) {
        return Left(
          NetworkExceptions.getException(exception),
        );
      }
    } else {
      return const Left(
        NetworkExceptions.noInternetConnection(),
      );
    }
  }
}
