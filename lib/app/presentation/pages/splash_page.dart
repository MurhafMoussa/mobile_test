import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:things_todo/app/presentation/controllers/splash_controller.dart';
import 'package:things_todo/app/presentation/controllers/welcome_controller.dart';
import 'package:things_todo/core/resources/app_routes.dart';
import 'package:things_todo/core/resources/custom_page_title.dart';
import 'package:things_todo/core/widgets/app_button.dart';
import 'package:things_todo/core/widgets/app_logo.dart';
import 'package:things_todo/core/widgets/constant_global_widgets.dart';
import 'package:things_todo/core/widgets/app_loading_widget.dart';
import 'package:things_todo/generated/l10n.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: appHorizontalPadding,
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 2,
                  child: AppLogo(),
                ),
                const SizedBox(
                  width: double.infinity,
                ),
                if (controller.isLoading.value)
                  Expanded(
                    child: AppLoadingWidget.dark(),
                  ),
              ],
            ),
          ),
        ),
      );
}
