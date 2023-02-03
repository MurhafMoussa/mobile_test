import 'package:dartz/dartz.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:things_todo/app/domain/bodies/register_body.dart';
import 'package:things_todo/app/domain/entities/user.dart';
import 'package:things_todo/app/domain/usecases/post_register_usecase.dart';
import 'package:things_todo/app/domain/usecases/post_update_information_usecase.dart';
import 'package:things_todo/core/errors/network_exceptions.dart';
import 'package:things_todo/core/resources/app_routes.dart';
import 'package:things_todo/core/widgets/display_data_widgets.dart';
import 'package:things_todo/main.dart';

class UpdateInformationController extends GetxController  {
  UpdateInformationController(this._postUpdateInformationUseCase);
  final PostUpdateInformationUseCase _postUpdateInformationUseCase;
  final TextEditingController emailController = TextEditingController();

  final TextEditingController countryCodeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final RxBool isLoading = false.obs;
  final GlobalKey<FormState> updateUserKey = GlobalKey();
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


}
