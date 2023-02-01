import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:things_todo/core/resources/app_validation_functions.dart';
import 'package:things_todo/core/resources/text_style_manager.dart';
import 'package:things_todo/core/widgets/app_logo.dart';
import 'package:things_todo/core/widgets/app_text_form_field.dart';
import 'package:things_todo/core/widgets/constant_global_widgets.dart';
import 'package:things_todo/features/home/presentation/controllers/login_controller.dart';
import 'package:things_todo/generated/l10n.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Padding(
        padding: appHorizontalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogo(
              scaleFactor: 0.3,
            ),
            Text(
              AppLocalizations.of(context).login,
              style: getLargeTitleTextStyle(),
            ),
            AppTextFormField(
              hintText: AppLocalizations.of(context).emailAddress,
              textEditingController: controller.emailController,
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (String? email) => AppValidation.validateEmail(
                email,
                context,
              ),
            ),
            Obx(
              () => AppTextFormField(
                hintText: AppLocalizations.of(context).password,
                textEditingController: controller.passwordController,
                passwordVisibility: controller.passwordVisibility.value,
                suffixIcon: IconButton(
                  onPressed: () => controller.changePasswordVisibility(),
                  icon: Icon(
                    controller.passwordVisibility.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
                validator: (String? password) => AppValidation.validatePassword(
                  password,
                  context,
                ),
              ),
            ),
          ],
        ),
      ),
    );
}
