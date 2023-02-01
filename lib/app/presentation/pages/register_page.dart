import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:things_todo/app/domain/bodies/register_body.dart';
import 'package:things_todo/app/presentation/controllers/register_controller.dart';
import 'package:things_todo/core/resources/app_routes.dart';
import 'package:things_todo/core/resources/app_validation_functions.dart';
import 'package:things_todo/core/resources/assets_manager.dart';
import 'package:things_todo/core/resources/color_manager.dart';
import 'package:things_todo/core/resources/constant_values.dart';
import 'package:things_todo/core/resources/text_style_manager.dart';
import 'package:things_todo/core/widgets/app_filled_button.dart';
import 'package:things_todo/core/widgets/app_logo.dart';
import 'package:things_todo/core/widgets/app_text_form_field.dart';
import 'package:things_todo/core/widgets/clickable_text.dart';
import 'package:things_todo/core/widgets/constant_global_widgets.dart';
import 'package:things_todo/core/widgets/loading_widget.dart';
import 'package:things_todo/core/widgets/password_icon.dart';
import 'package:things_todo/app/domain/usecases/post_login_usecase.dart';
import 'package:things_todo/app/presentation/controllers/login_controller.dart';
import 'package:things_todo/generated/l10n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                      Text(
                        AppLocalizations.of(context).register,
                        style: getLargeTitleTextStyle(),
                      ).paddingSymmetric(vertical: 25),
                      AppTextFormField(
                        hintText: AppLocalizations.of(context).fullName,
                        textEditingController: controller.nameController,
                        textInputAction: TextInputAction.next,
                        validator: (String? name) => AppValidation.validateName(
                          name,
                          context,
                        ),
                      ).paddingOnly(
                        bottom: paddingBetweenTextFieldsValue,
                      ),
                      phoneFormField(),
                      AppTextFormField(
                        hintText: AppLocalizations.of(context).emailAddress,
                        textEditingController: controller.emailController,
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: (String? email) =>
                            AppValidation.validateEmail(
                          email,
                          context,
                        ),
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
                              AppValidation.validateConfirmPassword(
                            password,
                            controller.passwordController.text,
                            context,
                          ),
                        ),
                      ).paddingOnly(
                        bottom: paddingBetweenTextFieldsValue,
                      ),
                      Obx(
                        () => AppFilledButton(
                          onPressed: _register,
                          content: controller.isLoading.value
                              ? const LoadingWidget()
                              : Text(
                                  AppLocalizations.of(context).register,
                                  style: getSmallTitleTextStyle()
                                      .copyWith(color: ColorManager.white),
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

  StatefulBuilder phoneFormField() => StatefulBuilder(
        builder: (context, setState) => AppTextFormField(
          hintText: AppLocalizations.of(context).phoneNumber,
          textEditingController: controller.phoneController,
          textInputType: TextInputType.number,
          textInputAction: TextInputAction.next,
          prefixIcon: GestureDetector(
            onTap: () async {
              controller.countryCode = await const FlCountryCodePicker()
                  .showPicker(context: context);
              if (controller.countryCode != null) {
                controller.countryCodeController.text =
                    controller.countryCode!.dialCode;
                setState(
                  () {},
                );
              }
            },
            child: SizedBox(
              child: controller.countryCode != null
                  ? controller.countryCode!.flagImage
                      .paddingSymmetric(horizontal: 10)
                  : const Icon(Icons.flag),
            ),
          ),
          validator: (String? name) => AppValidation.validatePhoneNumber(
            name,
            context,
          ),
        ).paddingOnly(
          bottom: paddingBetweenTextFieldsValue,
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
              ? '+971'
              : controller.countryCodeController.text,
          phone: controller.phoneController.text,
        ),
      );
    }
  }
}
