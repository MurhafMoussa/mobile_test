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
      return const Left(NetworkExceptions.unauthorizedRequest('Login First'));
    }
  }

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
      return const Left(NetworkExceptions.unauthorizedRequest('Login First'));
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
