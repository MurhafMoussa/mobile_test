import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:things_todo/core/api_global_responses/api_success_response.dart';
import 'package:things_todo/core/errors/network_exceptions.dart';
import 'package:things_todo/core/network/netwok_info.dart';
import 'package:things_todo/features/home/data/datasources/user_local_data_source.dart';
import 'package:things_todo/features/home/data/datasources/user_remote_data_source.dart';
import 'package:things_todo/features/home/domain/entities/user.dart';
import 'package:things_todo/features/home/domain/repositories/user_repository.dart';
import 'package:things_todo/features/home/domain/usecases/post_login_usecase.dart';

@Singleton(as: UserRepository)
class UserRepositoryImp implements UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;
  final UserLocalDataSource _userLocalDataSource;
  final NetworkInfo _networkInfo;
  UserRepositoryImp(
    this._userRemoteDataSource,
    this._networkInfo,
    this._userLocalDataSource,
  );

  @override
  Future<Either<NetworkExceptions, ApiSuccessResponse<User>>> login(
    LoginBody body,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _userRemoteDataSource.login(
          body,
        );
        await _userLocalDataSource.saveUser(response.data);
        return Right(
          response,
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
