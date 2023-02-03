import 'package:get/get.dart';
import 'package:things_todo/app/domain/entities/user.dart';
import 'package:things_todo/app/domain/usecases/get_authorization_status_usecase.dart';

import 'package:things_todo/core/resources/app_routes.dart';

class SplashController extends GetxController {
  SplashController(this._getAuthorizationStatusUseCase);
  final GetAuthorizationStatusUseCase _getAuthorizationStatusUseCase;
  @override
  Future<void> onReady() async {
    isLoading.value = true;
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        await checkAuthintication();
      },
    );
    super.onReady();
  }

  final RxBool isLoading = false.obs;

  Future<void> checkAuthintication() async {
    final isAuthinticated = await _getAuthorizationStatusUseCase();
    if (isAuthinticated) {
      Get.offAndToNamed(AppRoutes.homeRoute);
    } else {
      Get.offAndToNamed(AppRoutes.welcomeRoute);
    }
    isLoading.value = false;
  }
}
