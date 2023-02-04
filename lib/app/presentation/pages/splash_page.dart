import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:things_todo/app/presentation/controllers/splash_controller.dart';
import 'package:things_todo/core/widgets/app_loading_widget.dart';
import 'package:things_todo/core/widgets/app_logo.dart';
import 'package:things_todo/core/widgets/constant_global_widgets.dart';

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
