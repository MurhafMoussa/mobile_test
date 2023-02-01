// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;
import 'package:nb_utils/nb_utils.dart' as _i7;
import 'package:things_todo/core/api/api_consumer.dart' as _i9;
import 'package:things_todo/core/api/dio_consumer.dart' as _i10;
import 'package:things_todo/core/api/logging_interceptor.dart' as _i5;
import 'package:things_todo/core/network/netwok_info.dart' as _i6;
import 'package:things_todo/core/third_party_injection.dart' as _i15;
import 'package:things_todo/features/home/data/datasources/user_local_data_source.dart'
    as _i8;
import 'package:things_todo/features/home/data/datasources/user_remote_data_source.dart'
    as _i11;
import 'package:things_todo/features/home/data/repositories/user_repository_imp.dart'
    as _i13;
import 'package:things_todo/features/home/domain/repositories/user_repository.dart'
    as _i12;
import 'package:things_todo/features/home/domain/usecases/post_login_usecase.dart'
    as _i14;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final _i2.GetItHelper gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final _$ThirdPartyInjection thirdPartyInjection = _$ThirdPartyInjection();
    gh.singleton<_i3.Dio>(thirdPartyInjection.dio);
    gh.singleton<_i4.InternetConnectionChecker>(
        thirdPartyInjection.internetConnectionChecker,);
    gh.singleton<_i5.LoggingInterceptor>(_i5.LoggingInterceptor());
    gh.singleton<_i6.NetworkInfo>(_i6.NetworkInfoImpl(
        connectionChecker: gh<_i4.InternetConnectionChecker>(),),);
    await gh.factoryAsync<_i7.SharedPreferences>(
      () => thirdPartyInjection.sharedPrefrences,
      preResolve: true,
    );
    gh.singleton<_i8.UserLocalDataSource>(
        _i8.UserLocalDataSourceImp(gh<_i7.SharedPreferences>()),);
    gh.singleton<_i9.ApiConsumer>(_i10.DioConsumer(client: gh<_i3.Dio>()));
    gh.singleton<_i11.UserRemoteDataSource>(
        _i11.UserRemoteDataSourceImp(gh<_i9.ApiConsumer>()),);
    gh.singleton<_i12.UserRepository>(_i13.UserRepositoryImp(
      gh<_i11.UserRemoteDataSource>(),
      gh<_i6.NetworkInfo>(),
      gh<_i8.UserLocalDataSource>(),
    ),);
    gh.factory<_i14.PostLoginUseCase>(
        () => _i14.PostLoginUseCase(gh<_i12.UserRepository>()),);
    return this;
  }
}

class _$ThirdPartyInjection extends _i15.ThirdPartyInjection {}
