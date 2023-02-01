import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nb_utils/nb_utils.dart';

@module
abstract class ThirdPartyInjection {
  @Singleton()
  Dio get dio => Dio();
  @preResolve
  Future<SharedPreferences> get sharedPrefrences =>
      SharedPreferences.getInstance();
  @Singleton()
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();
  
}
