// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i7;
import 'package:nb_utils/nb_utils.dart' as _i9;
import 'package:things_todo/core/api/api_consumer.dart' as _i3;
import 'package:things_todo/core/api/dio_consumer.dart' as _i4;
import 'package:things_todo/core/api_global_responses/api_success_response.dart'
    as _i14;
import 'package:things_todo/core/network/netwok_info.dart' as _i6;
import 'package:things_todo/core/use_case/use_case.dart' as _i13;
import 'package:things_todo/features/home/data/datasources/user_local_data_source.dart'
    as _i8;
import 'package:things_todo/features/home/data/datasources/user_remote_data_source.dart'
    as _i10;
import 'package:things_todo/features/home/data/repositories/user_repository_imp.dart'
    as _i12;
import 'package:things_todo/features/home/domain/entities/user.dart' as _i15;
import 'package:things_todo/features/home/domain/repositories/user_repository.dart'
    as _i11;
import 'package:things_todo/features/home/domain/usecases/post_login_usecase.dart'
    as _i16;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiConsumer>(_i4.DioConsumer(client: gh<_i5.Dio>()));
    gh.factory<_i6.NetworkInfo>(() => _i6.NetworkInfoImpl(
        connectionChecker: gh<_i7.InternetConnectionChecker>()));
    gh.factory<_i8.UserLocalDataSource>(
        () => _i8.UserLocalDataSourceImp(gh<_i9.SharedPreferences>()));
    gh.factory<_i10.UserRemoteDataSource>(
        () => _i10.UserRemoteDataSourceImp(gh<_i3.ApiConsumer>()));
    gh.singleton<_i11.UserRepository>(_i12.UserRepositoryImp(
      gh<_i10.UserRemoteDataSource>(),
      gh<_i6.NetworkInfo>(),
      gh<_i8.UserLocalDataSource>(),
    ));
    gh.singleton<
            _i13.UseCase<_i14.ApiSuccessResponse<_i15.User>, _i16.LoginBody>>(
        _i16.PostLoginUseCase(gh<_i11.UserRepository>()));
    return this;
  }
}
