import 'package:injectable/injectable.dart';
import 'package:things_todo/app/domain/repositories/user_repository.dart';

@injectable
class GetAuthorizationStatusUseCase {
  GetAuthorizationStatusUseCase(this._userRepository);
  final UserRepository _userRepository;
  Future<bool> call() async =>
      await _userRepository.userIsAuthinticatedAndHasAuthorization();
}
