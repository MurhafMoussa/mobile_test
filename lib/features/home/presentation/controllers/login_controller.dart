import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:things_todo/core/errors/network_exceptions.dart';
import 'package:things_todo/features/home/domain/usecases/post_login_usecase.dart';

class LoginController extends GetxController with StateMixin<String> {

  LoginController(this._postLoginUseCase);
  final PostLoginUseCase _postLoginUseCase;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool passwordVisibility = false.obs;
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
  Future<void> login(LoginBody body) async {
    change(
      null,
      status: RxStatus.loading(),
    );
    final Either<NetworkExceptions, String> response = await _postLoginUseCase(body);
    response.fold(
      (NetworkExceptions error) => change(
        null,
        status: RxStatus.error(
          NetworkExceptions.getErrorMessage(error),
        ),
      ),
      (String data) => change(
        data,
        status: RxStatus.success(),
      ),
    );
  }

  void changePasswordVisibility() =>
      passwordVisibility.value = !passwordVisibility.value;
}
