import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:things_todo/app/domain/usecases/post_delete_user_usecase.dart';
import 'package:things_todo/core/errors/network_exceptions.dart';
import 'package:things_todo/core/resources/app_routes.dart';
import 'package:things_todo/core/widgets/display_data_widgets.dart';
import 'package:things_todo/core/use_case/use_case.dart';
import 'package:things_todo/main.dart';

class HomeController extends GetxController {
  HomeController(this._postDeleteUserUseCase);
  final PostDeleteUserUseCase _postDeleteUserUseCase;

  final RxBool isLoading = false.obs;

  Future<void> deleteUser() async {
    isLoading.value = true;

    final Either<NetworkExceptions, String> response =
        await _postDeleteUserUseCase(
      NoParams(),
    );
    response.fold(
      (NetworkExceptions error) {
        showErrorSnackBar(
          NetworkExceptions.getErrorMessage(
            error,
          ),
          MobileTest.navigatorKey.currentState!.context,
        );
        if (error is UnauthorizedRequest) {
          Get.offAllNamed(AppRoutes.loginRoute);
        }
      },
      (String data) {
        showSucessSnackBar(
          data,
          MobileTest.navigatorKey.currentState!.context,
        );
        Get.offAllNamed(AppRoutes.welcomeRoute);
      },
    );
    isLoading.value = false;
  }
}