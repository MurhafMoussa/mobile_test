import 'package:get/get.dart';
import 'package:things_todo/app/domain/usecases/post_login_usecase.dart';
import 'package:things_todo/app/presentation/controllers/login_controller.dart';
import 'package:things_todo/injection.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(
        () => getIt<PostLoginUseCase>(),
      )
      ..lazyPut<LoginController>(
        () => LoginController(
          Get.find(),
        ),
      );
  }
}
