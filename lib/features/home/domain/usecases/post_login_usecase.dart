import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:things_todo/core/api_global_responses/api_success_response.dart';
import 'package:things_todo/core/errors/network_exceptions.dart';
import 'package:things_todo/core/use_case/use_case.dart';
import 'package:things_todo/features/home/domain/entities/user.dart';
import 'package:things_todo/features/home/domain/repositories/user_repository.dart';

@Singleton(as: UseCase)
class PostLoginUseCase implements UseCase<ApiSuccessResponse<User>, LoginBody> {
  final UserRepository _userRepository;

  PostLoginUseCase(this._userRepository);
  @override
  Future<Either<NetworkExceptions, ApiSuccessResponse<User>>> call(
    LoginBody body,
  ) async {
    return await _userRepository.login(body);
  }
}

class LoginBody extends Equatable {
  final String email;
  final String password;

  const LoginBody(this.email, this.password);
  @override
  List<Object?> get props => [email, password];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'password': password});

    return result;
  }

  String toJson() => json.encode(toMap());
}
