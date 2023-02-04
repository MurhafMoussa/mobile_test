import 'package:get/get.dart';
import 'package:things_todo/app/domain/usecases/post_update_information_usecase.dart';
import 'package:things_todo/app/presentation/controllers/update_information_controller.dart';
import 'package:things_todo/injection.dart';

class UpdateInformationBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(
        () => getIt<PostUpdateInformationUseCase>(),
      )
      ..lazyPut<UpdateInformationController>(
        () => UpdateInformationController(
          Get.find(),
        ),
      );
  }
}
