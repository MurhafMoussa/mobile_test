import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:things_todo/app/domain/entities/user.dart';
import 'package:things_todo/app/presentation/controllers/update_information_controller.dart';
import 'package:things_todo/app/presentation/widgets/email_form_field.dart';
import 'package:things_todo/app/presentation/widgets/full_name_form_field.dart';
import 'package:things_todo/app/presentation/widgets/phone_form_field.dart';
import 'package:things_todo/core/resources/constant_values.dart';
import 'package:things_todo/core/resources/strings_manager.dart';
import 'package:things_todo/core/widgets/app_back_button.dart';
import 'package:things_todo/core/widgets/app_button.dart';
import 'package:things_todo/core/widgets/app_loading_widget.dart';
import 'package:things_todo/core/widgets/constant_global_widgets.dart';
import 'package:things_todo/generated/l10n.dart';

class UpdateInformationPage extends GetView<UpdateInformationController> {
  const UpdateInformationPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).changePassword,
          ),
          leading: const AppBackButton(),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: controller.updateUserKey,
            child: Padding(
              padding: appHorizontalPadding,
              child: Column(
                children: [
                  FullNameFormField(
                    nameController: controller.nameController,
                  ).paddingOnly(
                    bottom: paddingBetweenTextFieldsValue,
                    top: paddingBetweenTextFieldsValue,
                  ),
                  PhoneFormField(
                    countryCodeController: controller.countryCodeController,
                    phoneController: controller.phoneController,
                  ),
                  EmailFormField(
                    emailController: controller.emailController,
                  ).paddingOnly(
                    bottom: paddingBetweenTextFieldsValue,
                  ),
                  Obx(
                    () => AppButton.filled(
                      onPressed: _updateUserInformation,
                      content: controller.isLoading.value
                          ? AppLoadingWidget.light()
                          : Text(
                              AppLocalizations.of(context).save,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Future<void> _updateUserInformation() async {
    if (controller.updateUserKey.currentState!.validate()) {
      await controller.updateInformation(
        User(
          email: controller.emailController.text,
          name: controller.nameController.text,
          countryCode: controller.countryCodeController.text.isEmpty
              ? StringsManager.defaultCountryCode
              : controller.countryCodeController.text,
          phone: controller.phoneController.text,
        ),
      );
    }
  }
}
