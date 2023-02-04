import 'package:get/get.dart';
import 'package:things_todo/app/domain/usecases/get_authorization_status_usecase.dart';
import 'package:things_todo/app/presentation/controllers/splash_controller.dart';
import 'package:things_todo/injection.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(
        () => getIt<GetAuthorizationStatusUseCase>(),
      )
      ..lazyPut<SplashController>(
        () => SplashController(
          Get.find(),
        ),
      );
  }
}
