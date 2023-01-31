import 'package:dartz/dartz.dart';
import 'package:things_todo/core/api_global_responses/api_success_response.dart';
import 'package:things_todo/core/errors/network_exceptions.dart';
import 'package:things_todo/features/home/domain/entities/user.dart';
import 'package:things_todo/features/home/domain/usecases/post_login_usecase.dart';

abstract class UserRepository {
  // Future<Either<Failure, ApiSuccessResponse<User>>> getUser();
  // Future<Either<Failure, bool>> isAuthinticated();
  Future<Either<NetworkExceptions, ApiSuccessResponse<User>>> login(LoginBody loginBody);
  // Future<Either<Failure, ApiSuccessResponse<User>>> register();
  // Future<Either<Failure,ApiSuccessResponse<User>>> updateUser(User user);
  // Future<Either<Failure, ApiSuccessResponse<Unit>>> changePassword();
  // Future<Either<Failure, ApiSuccessResponse<Unit>>> deleteUser();
}
