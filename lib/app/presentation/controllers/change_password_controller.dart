import 'package:dartz/dartz.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:things_todo/app/domain/bodies/change_password_body.dart';
import 'package:things_todo/app/domain/bodies/register_body.dart';
import 'package:things_todo/app/domain/usecases/post_change_password_usecase.dart';
import 'package:things_todo/app/domain/usecases/post_register_usecase.dart';
import 'package:things_todo/core/errors/network_exceptions.dart';
import 'package:things_todo/core/resources/app_routes.dart';
import 'package:things_todo/core/widgets/display_data_widgets.dart';
import 'package:things_todo/main.dart';

class ChangePasswordController extends GetxController {
  ChangePasswordController(this._postChangePasswordUseCase);
  final PostChangePasswordUseCase _postChangePasswordUseCase;

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordConfirmationController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  final RxBool newPasswordVisibility = true.obs;
  final RxBool oldPasswordVisibility = true.obs;
  final RxBool newPasswordConfirmationVisibility = true.obs;
  final RxBool isLoading = false.obs;
  final GlobalKey<FormState> changePasswordKey = GlobalKey();
  @override
  void onClose() {
    oldPasswordController.dispose();
    newPasswordConfirmationController.dispose();
    newPasswordController.dispose();

    super.onClose();
  }

  Future<void> changePassword(ChangePasswordBody body) async {
    isLoading.value = true;

    final Either<NetworkExceptions, String> response =
        await _postChangePasswordUseCase(
      body,
    );
    response.fold(
      (NetworkExceptions error) {
        showErrorSnackBar(
          NetworkExceptions.getErrorMessage(
            error,
          ),
          MobileTest.navigatorKey.currentState!.context,
        );
        if(error is UnauthorizedRequest) {
          Get.offAllNamed(AppRoutes.loginRoute);
        }
      },
      (String data) {
        showSucessSnackBar(
          data,
          MobileTest.navigatorKey.currentState!.context,
        );
        Get.back();
      },
    );
    isLoading.value = false;
  }

  void changeNewPasswordVisibility() =>
      newPasswordVisibility.value = !newPasswordVisibility.value;
  void changeOldPasswordVisibility() =>
      oldPasswordVisibility.value = !oldPasswordVisibility.value;
  void changeNewPasswordConfirmationVisibility() =>
      newPasswordConfirmationVisibility.value =
          !newPasswordConfirmationVisibility.value;
}
