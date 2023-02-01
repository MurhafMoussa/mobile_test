
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:things_todo/core/errors/network_exceptions.dart';
import 'package:things_todo/core/use_case/use_case.dart';
import 'package:things_todo/features/home/domain/repositories/user_repository.dart';

@injectable
class PostLoginUseCase implements UseCase<String, LoginBody> {

  PostLoginUseCase(this._userRepository);
  final UserRepository _userRepository;
  @override
  Future<Either<NetworkExceptions,String>> call(
    LoginBody body,
  ) async => await _userRepository.login(body);
}

class LoginBody extends Equatable {

  const LoginBody(this.email, this.password);
  final String email;
  final String password;
  @override
  List<Object?> get props => [email, password];

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'password': password});

    return result;
  }

  
}
