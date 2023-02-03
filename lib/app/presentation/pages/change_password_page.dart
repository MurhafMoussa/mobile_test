import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:things_todo/app/domain/bodies/change_password_body.dart';
import 'package:things_todo/app/presentation/controllers/change_password_controller.dart';
import 'package:things_todo/app/presentation/widgets/password_icon.dart';
import 'package:things_todo/core/resources/app_validation_functions.dart';
import 'package:things_todo/core/resources/constant_values.dart';
import 'package:things_todo/core/widgets/app_back_button.dart';
import 'package:things_todo/core/widgets/app_button.dart';
import 'package:things_todo/core/widgets/app_text_form_field.dart';
import 'package:things_todo/core/widgets/constant_global_widgets.dart';
import 'package:things_todo/core/widgets/loading_widget.dart';
import 'package:things_todo/generated/l10n.dart';

class ChangePasswordPage extends GetView<ChangePasswordController> {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).changePassword,
          ),
          leading: const AppBackButton(),
        ),
        body: Form(
          key: controller.changePasswordKey,
          child: Padding(
            padding: appHorizontalPadding,
            child: Column(
              children: [
                Obx(
                  () => AppTextFormField(
                    hintText: AppLocalizations.of(context).oldPassword,
                    textEditingController: controller.oldPasswordController,
                    passwordVisibility: controller.oldPasswordVisibility.value,
                    suffixIcon: PasswordIcon(
                      changeVisibility: () =>
                          controller.changeOldPasswordVisibility(),
                      visible: controller.oldPasswordVisibility.value,
                    ),
                    validator: (String? password) =>
                        AppValidation.validateOldPassword(
                      password,
                      context,
                    ),
                  ),
                ).paddingOnly(
                  bottom: paddingBetweenTextFieldsValue,
                  top: paddingBetweenTextFieldsValue,
                ),
                Obx(
                  () => AppTextFormField(
                    hintText: AppLocalizations.of(context).newPassword,
                    textEditingController: controller.newPasswordController,
                    passwordVisibility: controller.newPasswordVisibility.value,
                    suffixIcon: PasswordIcon(
                      changeVisibility: () =>
                          controller.changeNewPasswordVisibility(),
                      visible: controller.newPasswordVisibility.value,
                    ),
                    validator: (String? password) =>
                        AppValidation.validateNewPassword(
                      password,
                      context,
                    ),
                  ),
                ).paddingOnly(
                  bottom: paddingBetweenTextFieldsValue,
                ),
                Obx(
                  () => AppTextFormField(
                    hintText: AppLocalizations.of(context).confirmNewPassword,
                    textEditingController:
                        controller.newPasswordConfirmationController,
                    passwordVisibility:
                        controller.newPasswordConfirmationVisibility.value,
                    suffixIcon: PasswordIcon(
                      changeVisibility: () =>
                          controller.changeNewPasswordConfirmationVisibility(),
                      visible:
                          controller.newPasswordConfirmationVisibility.value,
                    ),
                    validator: (String? password) =>
                        AppValidation.validateNewPasswordConfirmation(
                      password,
                      controller.newPasswordController.text,
                      context,
                    ),
                  ),
                ).paddingOnly(
                  bottom: paddingBetweenTextFieldsValue,
                ),
                Obx(
                  () => AppButton.filled(
                    onPressed: _changePassword,
                    content: controller.isLoading.value
                        ? const LoadingWidget()
                        : Text(
                            AppLocalizations.of(context).save,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Future<void> _changePassword() async {
    if (controller.changePasswordKey.currentState!.validate()) {
      await controller.changePassword(
        ChangePasswordBody(
          oldPassword: controller.oldPasswordController.text,
          newPassword: controller.newPasswordController.text,
          newPasswordConfirmation:
              controller.newPasswordConfirmationController.text,
        ),
      );
    }
  }
}
