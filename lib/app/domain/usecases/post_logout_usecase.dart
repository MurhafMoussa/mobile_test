import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:things_todo/app/domain/repositories/user_repository.dart';
import 'package:things_todo/core/errors/network_exceptions.dart';
import 'package:things_todo/core/use_case/use_case.dart';

@injectable
class PostLogoutUseCase implements UseCase<String, NoParams> {
  PostLogoutUseCase(this._userRepository);
  final UserRepository _userRepository;
  @override
  Future<Either<NetworkExceptions, String>> call(
    NoParams noParams,
  ) async =>
      await _userRepository.logout();
}
