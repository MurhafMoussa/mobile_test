import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:things_todo/app/presentation/controllers/welcome_controller.dart';
import 'package:things_todo/core/resources/app_routes.dart';
import 'package:things_todo/core/resources/custom_page_title.dart';
import 'package:things_todo/core/widgets/app_button.dart';
import 'package:things_todo/core/widgets/app_logo.dart';
import 'package:things_todo/core/widgets/constant_global_widgets.dart';
import 'package:things_todo/generated/l10n.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPageTitle(
                      text: AppLocalizations.of(context).welcomeToTheApp,
                    ).paddingOnly(
                      top: 25,
                      bottom: 100,
                    ),
                    AppButton.filled(
                      onPressed: () async => await Get.offAndToNamed(
                        AppRoutes.loginRoute,
                      ),
                      content: Text(
                        AppLocalizations.of(context).login,
                      ),
                    ).paddingSymmetric(vertical: 10),
                    AppButton.outlined(
                      onPressed: () async => await Get.offAndToNamed(
                        AppRoutes.registerRoute,
                      ),
                      content: Text(
                        AppLocalizations.of(context).register,
                      ),
                    ).paddingSymmetric(vertical: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
