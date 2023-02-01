import 'package:get/get.dart';
import 'package:things_todo/app/domain/usecases/post_login_usecase.dart';
import 'package:things_todo/app/domain/usecases/post_register_usecase.dart';
import 'package:things_todo/app/presentation/controllers/login_controller.dart';
import 'package:things_todo/app/presentation/controllers/register_controller.dart';
import 'package:things_todo/injection.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(
        () => getIt<PostRegisterUseCase>(),
      )
      ..lazyPut<RegisterController>(
        () => RegisterController(
          Get.find(),
        ),
      );
  }
}
