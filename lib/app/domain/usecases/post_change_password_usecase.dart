
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:things_todo/app/domain/bodies/change_password_body.dart';
import 'package:things_todo/app/domain/repositories/user_repository.dart';
import 'package:things_todo/core/errors/network_exceptions.dart';
import 'package:things_todo/core/use_case/use_case.dart';

@injectable
class PostChangePasswordUseCase implements UseCase<String, ChangePasswordBody> {

  PostChangePasswordUseCase(this._userRepository);
  final UserRepository _userRepository;
  @override
  Future<Either<NetworkExceptions,String>> call(
    ChangePasswordBody body,
  ) async => await _userRepository.changePassword(body);
}


  
