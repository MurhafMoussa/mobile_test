import 'package:get/get.dart';
import 'package:things_todo/features/home/domain/usecases/post_login_usecase.dart';
import 'package:things_todo/features/home/presentation/controllers/login_controller.dart';
import 'package:things_todo/injection.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      getIt<PostLoginUseCase>(),
    );
    Get.put<LoginController>(
      LoginController(
        Get.find(),
      ),
    );
  }
}
