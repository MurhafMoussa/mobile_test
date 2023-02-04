import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:things_todo/app/data/datasources/user_local_data_source.dart';
import 'package:things_todo/app/data/datasources/user_remote_data_source.dart';
import 'package:things_todo/app/data/models/user_model/user_model.dart';
import 'package:things_todo/app/domain/bodies/change_password_body.dart';
import 'package:things_todo/app/domain/bodies/login_body.dart';
import 'package:things_todo/app/domain/bodies/register_body.dart';
import 'package:things_todo/app/domain/entities/user.dart';
import 'package:things_todo/app/domain/repositories/user_repository.dart';
import 'package:things_todo/core/api_global_responses/api_success_response.dart';
import 'package:things_todo/core/errors/network_exceptions.dart';
import 'package:things_todo/core/network/netwok_info.dart';
import 'package:things_todo/generated/l10n.dart';
import 'package:things_todo/main.dart';

@Singleton(as: UserRepository)
class UserRepositoryImp implements UserRepository {
  UserRepositoryImp(
    this._userRemoteDataSource,
    this._networkInfo,
    this._userLocalDataSource,
  );
  final UserRemoteDataSource _userRemoteDataSource;
  final UserLocalDataSource _userLocalDataSource;
  final NetworkInfo _networkInfo;
  UserModel? user;
  DateTime? _tokenExpiryDate;
  @override
  Future<Either<NetworkExceptions, String>> login(
    LoginBody body,
  ) async =>
      await _getResultsAndSaveUser(
        () => _userRemoteDataSource.login(body),
      );

  @override
  Future<Either<NetworkExceptions, String>> register(
    RegisterBody registerBody,
  ) async =>
      await _getResultsAndSaveUser(
        () => _userRemoteDataSource.register(registerBody),
      );
  @override
  Future<Either<NetworkExceptions, String>> changePassword(
    ChangePasswordBody changePasswordBody,
  ) async {
    if (await userIsAuthinticatedAndHasAuthorization()) {
      return await _getResults(
        () => _userRemoteDataSource.changePassword(
          changePasswordBody,
        ),
      );
    } else {
      // so basicly when the token is expired we logout the user and remove
      // his info from local storage
      await _userLocalDataSource.removeUser();
      return Left(
        NetworkExceptions.unauthorizedRequest(
          getLoginMessage(),
        ),
      );
    }
  }

  @override
  Future<Either<NetworkExceptions, String>> deleteUser() async {
    if (await userIsAuthinticatedAndHasAuthorization()) {
      final response = await _getResults(
        () => _userRemoteDataSource.deleteAccount(),
      );
      await _userLocalDataSource.removeUser();
      return response;
    } else {
      //the same as update user
      await _userLocalDataSource.removeUser();
      return Left(
        NetworkExceptions.unauthorizedRequest(
          getLoginMessage(),
        ),
      );
    }
  }

  String getLoginMessage() =>
      AppLocalizations.of(MobileTest.navigatorKey.currentState!.context)
          .loginFirst;

  @override
  Future<Either<NetworkExceptions, String>> logout() async {
    if (await userIsAuthinticatedAndHasAuthorization()) {
      await _userLocalDataSource.removeUser();
      return getLogoutMessage();
    } else {
      //the same as update user
      await _userLocalDataSource.removeUser();
      return Left(
        NetworkExceptions.unauthorizedRequest(
          getLoginMessage(),
        ),
      );
    }
  }

  Right<NetworkExceptions, String> getLogoutMessage() => Right(
        AppLocalizations.of(MobileTest.navigatorKey.currentState!.context)
            .youHaveLoggedOutSuccessfuly,
      );

  DateTime _parseTokenExpiryDateStringToDateTime(
    UserModel? user,
  ) =>
      DateFormat(
        'yyyy-MM-dd',
      ).parse(
        user != null ? user.tokenExpiry! : '',
      );

  bool _tokenIsNotExpired() => DateTime.now().isBefore(_tokenExpiryDate!);

  Future<UserModel?> _getUser() async {
    try {
      return _userLocalDataSource.getUser();
    } catch (e) {
      throw const NetworkExceptions.unableToProcess();
    }
  }

  @override
  Future<Either<NetworkExceptions, String>> updateUser(User user) async {
    if (await userIsAuthinticatedAndHasAuthorization()) {
      return await _makeTheUpdateUserApiCallAndUpdateTheCurrentUserInLocalStorage(
        user,
      );
    } else {
      // the same action as the updatePassword
      await _userLocalDataSource.removeUser();
      return Left(
        NetworkExceptions.unauthorizedRequest(
          getLoginMessage(),
        ),
      );
    }
  }

  Future<Either<NetworkExceptions, String>>
      _makeTheUpdateUserApiCallAndUpdateTheCurrentUserInLocalStorage(
    User user,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        UserModel userModel = UserModel(
          name: '',
          countryCode: '',
          phone: '',
          email: '',
        );
        userModel = userModel.fromEntity(user);
        final ApiSuccessResponse<UserModel> response =
            await _userRemoteDataSource.updateUser(
          userModel,
        );
        await _userLocalDataSource.updateUser(response.data);
        return Right(
          response.message,
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

  @override
  Future<bool> userIsAuthinticatedAndHasAuthorization() async {
    try {
      await _getUser().then(
        (user) {
          this.user = user;
          _tokenExpiryDate = _parseTokenExpiryDateStringToDateTime(user);
        },
      );
      if (_tokenIsNotExpired() && user != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either<NetworkExceptions, User>> getUser() async {
    try {
      final userModel = await _getUser();
      final User user = userModel != null
          ? User(
              name: userModel.name,
              email: userModel.email,
              phone: userModel.phone,
              countryCode: userModel.countryCode,
            )
          : const User(
              name: '',
              email: '',
              phone: '',
              countryCode: '',
            );
      return Right(user);
    } catch (e) {
      return Left(
        NetworkExceptions.getException(e),
      );
    }
  }

  // Generic Functions to reduce boilerplate
  Future<Either<NetworkExceptions, String>> _getResultsAndSaveUser(
    Future<ApiSuccessResponse<UserModel>> Function() apiCall,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final ApiSuccessResponse<UserModel> response = await apiCall();
        await _userLocalDataSource.saveUser(response.data);
        return Right(
          response.message,
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

  Future<Either<NetworkExceptions, String>> _getResults(
    Future<ApiSuccessResponse<void>> Function() apiCall,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final ApiSuccessResponse<void> response = await apiCall();
        return Right(
          response.message,
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
