
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:things_todo/app/domain/bodies/login_body.dart';
import 'package:things_todo/app/domain/repositories/user_repository.dart';
import 'package:things_todo/core/errors/network_exceptions.dart';
import 'package:things_todo/core/use_case/use_case.dart';

@injectable
class PostLoginUseCase implements UseCase<String, LoginBody> {

  PostLoginUseCase(this._userRepository);
  final UserRepository _userRepository;
  @override
  Future<Either<NetworkExceptions,String>> call(
    LoginBody body,
  ) async => await _userRepository.login(body);
}


