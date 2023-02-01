import 'package:dartz/dartz.dart';
import 'package:things_todo/app/domain/bodies/login_body.dart';
import 'package:things_todo/app/domain/bodies/register_body.dart';
import 'package:things_todo/core/errors/network_exceptions.dart';

abstract class UserRepository {
  // Future<Either<Failure, ApiSuccessResponse<User>>> getUser();
  // Future<Either<Failure, bool>> isAuthinticated();
  Future<Either<NetworkExceptions, String>> login(LoginBody loginBody);
  Future<Either<NetworkExceptions, String>> register(RegisterBody registerBody);
  // Future<Either<Failure,ApiSuccessResponse<User>>> updateUser(User user);
  // Future<Either<Failure, ApiSuccessResponse<Unit>>> changePassword();
  // Future<Either<Failure, ApiSuccessResponse<Unit>>> deleteUser();
}
