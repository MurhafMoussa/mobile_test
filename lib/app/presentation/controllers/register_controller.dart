import 'package:dartz/dartz.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:things_todo/app/domain/bodies/register_body.dart';
import 'package:things_todo/app/domain/usecases/post_register_usecase.dart';
import 'package:things_todo/core/errors/network_exceptions.dart';
import 'package:things_todo/core/resources/app_routes.dart';
import 'package:things_todo/core/resources/display_data_widgets.dart';
import 'package:things_todo/main.dart';

class RegisterController extends GetxController  {
  RegisterController(this._postRegisterUseCase);
  final PostRegisterUseCase _postRegisterUseCase;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final TextEditingController countryCodeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();


  final RxBool passwordVisibility = true.obs;
  final RxBool passwordConfirmationVisibility = true.obs;
  final RxBool isLoading = false.obs;
  final GlobalKey<FormState> registerKey = GlobalKey();
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    nameController.dispose();
    phoneController.dispose();
    countryCodeController.dispose();
    super.onClose();
  }

  Future<void> register(RegisterBody body) async {
    isLoading.value = true;

    final Either<NetworkExceptions, String> response =
        await _postRegisterUseCase(
      body,
    );
    response.fold(
      (NetworkExceptions error) => showErrorSnackBar(
        NetworkExceptions.getErrorMessage(
          error,
        ),
        MobileTest.navigatorKey.currentState!.context,
      ),
      (String data) {
        showSucessSnackBar(
          data,
          MobileTest.navigatorKey.currentState!.context,
        );
        Get.offAndToNamed(AppRoutes.homeRoute);
      },
    );
    isLoading.value = false;
  }

  void changePasswordVisibility() =>
      passwordVisibility.value = !passwordVisibility.value;
  void changePasswordConfirmationVisibility() =>
      passwordConfirmationVisibility.value =
          !passwordConfirmationVisibility.value;
}
