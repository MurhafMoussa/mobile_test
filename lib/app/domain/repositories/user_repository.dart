import 'package:dartz/dartz.dart';
import 'package:things_todo/app/domain/bodies/change_password_body.dart';
import 'package:things_todo/app/domain/bodies/login_body.dart';
import 'package:things_todo/app/domain/bodies/register_body.dart';
import 'package:things_todo/app/domain/entities/user.dart';
import 'package:things_todo/core/api_global_responses/api_success_response.dart';
import 'package:things_todo/core/errors/network_exceptions.dart';

abstract class UserRepository {
  Future< bool>
      userIsAuthinticatedAndHasAuthorization();
  Future<Either<NetworkExceptions, String>> login(
    LoginBody loginBody,
  );
  Future<Either<NetworkExceptions, String>> register(
    RegisterBody registerBody,
  );
  Future<Either<NetworkExceptions, String>> updateUser(User user);
  Future<Either<NetworkExceptions, String>> changePassword(
    ChangePasswordBody changePasswordBody,
  );
  Future<Either<NetworkExceptions, String>> deleteUser();
}
