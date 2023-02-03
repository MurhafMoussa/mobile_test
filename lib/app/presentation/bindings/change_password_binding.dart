import 'package:get/get.dart';
import 'package:things_todo/app/domain/usecases/post_change_password_usecase.dart';
import 'package:things_todo/app/presentation/controllers/change_password_controller.dart';
import 'package:things_todo/injection.dart';

class ChangePasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(
        () => getIt<PostChangePasswordUseCase>(),
      )
      ..lazyPut<ChangePasswordController>(
        () => ChangePasswordController(
          Get.find(),
        ),
      );
  }
}
