import 'package:get/get.dart';
import 'package:things_todo/app/domain/usecases/get_user_usecase.dart';
import 'package:things_todo/app/domain/usecases/post_delete_user_usecase.dart';
import 'package:things_todo/app/domain/usecases/post_logout_usecase.dart';
import 'package:things_todo/app/presentation/controllers/home_controller.dart';
import 'package:things_todo/injection.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(
        () => getIt<PostDeleteUserUseCase>(),
      )..lazyPut(
        () => getIt<PostLogoutUseCase>(),
      )..lazyPut(
        () => getIt<GetUserUseCase>(),
      )
      ..lazyPut<HomeController>(
        () => HomeController(
          Get.find(),
          Get.find(),
          Get.find(),
        ),
      );
  }
}
