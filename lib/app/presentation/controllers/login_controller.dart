import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:things_todo/app/domain/bodies/login_body.dart';
import 'package:things_todo/core/errors/network_exceptions.dart';
import 'package:things_todo/core/resources/display_data_widgets.dart';
import 'package:things_todo/app/domain/usecases/post_login_usecase.dart';
import 'package:things_todo/main.dart';

class LoginController extends GetxController {
  LoginController(this._postLoginUseCase);
  final PostLoginUseCase _postLoginUseCase;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool passwordVisibility = true.obs;
  final RxBool isLoading = false.obs;
  final GlobalKey<FormState> loginKey = GlobalKey();
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login(LoginBody body) async {
    isLoading.value = true;

    final Either<NetworkExceptions, String> response = await _postLoginUseCase(
      body,
    );
    response.fold(
      (NetworkExceptions error) => showErrorSnackBar(
        NetworkExceptions.getErrorMessage(
          error,
        ),
        MobileTest.navigatorKey.currentState!.context,
      ),
      (String data) => showSucessSnackBar(
        data,
        MobileTest.navigatorKey.currentState!.context,
      ),
    );
    isLoading.value = false;
  }

  void changePasswordVisibility() =>
      passwordVisibility.value = !passwordVisibility.value;
}
