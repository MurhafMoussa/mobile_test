import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:things_todo/app/domain/bodies/login_body.dart';
import 'package:things_todo/app/presentation/controllers/login_controller.dart';
import 'package:things_todo/app/presentation/widgets/clickable_text.dart';
import 'package:things_todo/app/presentation/widgets/email_form_field.dart';
import 'package:things_todo/app/presentation/widgets/password_icon.dart';
import 'package:things_todo/core/resources/app_routes.dart';
import 'package:things_todo/core/resources/app_validation_functions.dart';
import 'package:things_todo/core/resources/constant_values.dart';
import 'package:things_todo/core/resources/custom_page_title.dart';
import 'package:things_todo/core/widgets/app_button.dart';
import 'package:things_todo/core/widgets/app_logo.dart';
import 'package:things_todo/core/widgets/app_text_form_field.dart';
import 'package:things_todo/core/widgets/constant_global_widgets.dart';
import 'package:things_todo/core/widgets/app_loading_widget.dart';
import 'package:things_todo/generated/l10n.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

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
              columnFlex: 3,
              child: SingleChildScrollView(
                child: Form(
                  key: controller.loginKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomPageTitle(
                        text: AppLocalizations.of(context).login,
                      ).paddingSymmetric(vertical: 25),
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
                        () => AppButton.filled(
                          onPressed: _login,
                          content: controller.isLoading.value
                              ?  AppLoadingWidget.light()
                              : Text(
                                  AppLocalizations.of(context).login,
                                ),
                        ).paddingSymmetric(vertical: 10),
                      ),
                      ClickableText(
                        content: AppLocalizations.of(context).dontHaveAnAccount,
                        contentToBeClicked:
                            AppLocalizations.of(context).register,
                        onTappingContent: (_) async {
                          await Get.offAndToNamed(AppRoutes.registerRoute);
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

  Future<void> _login() async {
    if (controller.loginKey.currentState!.validate()) {
      await controller.login(
        LoginBody(
          email: controller.emailController.text,
          password: controller.passwordController.text,
        ),
      );
    }
  }
}
