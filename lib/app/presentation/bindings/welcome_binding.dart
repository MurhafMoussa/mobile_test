import 'package:get/get.dart';
import 'package:things_todo/app/presentation/controllers/welcome_controller.dart';

class WelcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get
      .lazyPut<WelcomeController>(
        () => WelcomeController(
         
        ),
      );
  }
}
