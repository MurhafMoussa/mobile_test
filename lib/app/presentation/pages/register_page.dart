import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:things_todo/app/domain/bodies/register_body.dart';
import 'package:things_todo/app/presentation/controllers/register_controller.dart';
import 'package:things_todo/app/presentation/widgets/email_form_field.dart';
import 'package:things_todo/app/presentation/widgets/full_name_form_field.dart';
import 'package:things_todo/app/presentation/widgets/password_icon.dart';
import 'package:things_todo/app/presentation/widgets/phone_form_field.dart';
import 'package:things_todo/core/resources/app_routes.dart';
import 'package:things_todo/core/resources/app_validation_functions.dart';
import 'package:things_todo/core/resources/constant_values.dart';
import 'package:things_todo/core/resources/custom_page_title.dart';
import 'package:things_todo/core/resources/strings_manager.dart';
import 'package:things_todo/core/widgets/app_button.dart';
import 'package:things_todo/core/widgets/app_logo.dart';
import 'package:things_todo/core/widgets/app_text_form_field.dart';
import 'package:things_todo/core/widgets/constant_global_widgets.dart';
import 'package:things_todo/core/widgets/loading_widget.dart';
import 'package:things_todo/generated/l10n.dart';

import '../widgets/clickable_text.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ResponsiveRowColumn(
          layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          columnPadding: appHorizontalPadding,
          rowMainAxisAlignment: MainAxisAlignment.center,
          columnMainAxisAlignment: MainAxisAlignment.center,
          rowPadding: appHorizontalPadding,
          children: [
            const ResponsiveRowColumnItem(
              rowFlex: 1,
              columnFlex: 1,
              child: AppLogo(),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 2,
              columnFlex: 2,
              child: SingleChildScrollView(
                child: Form(
                  key: controller.registerKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomPageTitle(
                        text: AppLocalizations.of(context).register,
                      ).paddingSymmetric(vertical: 25),
                      FullNameFormField(
                        nameController: controller.nameController,
                      ).paddingOnly(
                        bottom: paddingBetweenTextFieldsValue,
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
                        () => AppTextFormField(
                          hintText: AppLocalizations.of(context).password,
                          textEditingController: controller.passwordController,
                                           

                          passwordVisibility:
                              controller.passwordVisibility.value,
                          textInputAction: TextInputAction.next,
                          suffixIcon: PasswordIcon(
                            changeVisibility: () =>
                                controller.changePasswordVisibility(),
                            visible: controller.passwordVisibility.value,
                          ),
                          validator: (String? password) =>
                              AppValidation.validatePassword(
                            password,
                            context,
                          ),
                        ),
                      ).paddingOnly(
                        bottom: paddingBetweenTextFieldsValue,
                      ),
                      Obx(
                        () => AppTextFormField(
                          hintText:
                              AppLocalizations.of(context).confirmPassword,
                          textEditingController:
                              controller.passwordConfirmationController,
                          passwordVisibility:
                              controller.passwordConfirmationVisibility.value,
                          suffixIcon: PasswordIcon(
                            changeVisibility: () => controller
                                .changePasswordConfirmationVisibility(),
                            visible:
                                controller.passwordConfirmationVisibility.value,
                          ),
                          validator: (String? password) =>
                              AppValidation.validatePasswordConfirmation(
                            password,
                            controller.passwordController.text,
                            context,
                          ),
                        ),
                      ).paddingOnly(
                        bottom: paddingBetweenTextFieldsValue,
                      ),
                      Obx(
                        () => AppButton.filled(
                          onPressed: _register,
                          content: controller.isLoading.value
                              ? const LoadingWidget()
                              : Text(
                                  AppLocalizations.of(context).register,
                                ),
                        ).paddingSymmetric(vertical: 10),
                      ),
                      ClickableText(
                        content:
                            AppLocalizations.of(context).alreadyHaveAnAccount,
                        contentToBeClicked: AppLocalizations.of(context).login,
                        onTappingContent: (_) async {
                          await Get.offAndToNamed(AppRoutes.loginRoute);
                        },
                      ).paddingOnly(bottom: 10, top: 50),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Future<void> _register() async {
    if (controller.registerKey.currentState!.validate()) {
      await controller.register(
        RegisterBody(
          email: controller.emailController.text,
          password: controller.passwordController.text,
          passwordConfirmation: controller.passwordConfirmationController.text,
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
