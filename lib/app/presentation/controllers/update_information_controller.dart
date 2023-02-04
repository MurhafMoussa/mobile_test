import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:things_todo/app/domain/entities/user.dart';
import 'package:things_todo/app/domain/usecases/post_update_information_usecase.dart';
import 'package:things_todo/app/presentation/controllers/home_controller.dart';
import 'package:things_todo/core/errors/network_exceptions.dart';
import 'package:things_todo/core/resources/app_routes.dart';
import 'package:things_todo/core/widgets/display_data_widgets.dart';
import 'package:things_todo/main.dart';

class UpdateInformationController extends GetxController {
  UpdateInformationController(this._postUpdateInformationUseCase);
  final PostUpdateInformationUseCase _postUpdateInformationUseCase;
  late final TextEditingController emailController;
  late final TextEditingController countryCodeController;
  late final TextEditingController phoneController;
  late final TextEditingController nameController;
  final RxBool isLoading = false.obs;
  final GlobalKey<FormState> updateUserKey = GlobalKey();
  @override
  void onInit() {
    final user = Get.find<HomeController>().user;
    emailController = TextEditingController(text: user.value.email);
    nameController = TextEditingController(text: user.value.name);
    phoneController = TextEditingController(text: user.value.phone);
    countryCodeController = TextEditingController(text: user.value.countryCode);
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    nameController.dispose();
    phoneController.dispose();
    countryCodeController.dispose();
    super.onClose();
  }

  Future<void> updateInformation(User body) async {
    isLoading.value = true;

    final Either<NetworkExceptions, String> response =
        await _postUpdateInformationUseCase(
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
        if (error is UnauthorizedRequest) {
          Get.offAllNamed(AppRoutes.loginRoute);
        }
      },
      (String data) {
        showSucessSnackBar(
          data,
          MobileTest.navigatorKey.currentState!.context,
        );
        Get
          ..find<HomeController>().getUser()
          ..back();
      },
    );
    isLoading.value = false;
  }
}
