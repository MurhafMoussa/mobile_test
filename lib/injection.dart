import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:things_todo/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
)
void configureDependencies() => getIt.init();
