import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:things_todo/app/presentation/controllers/home_controller.dart';
import 'package:things_todo/app/presentation/widgets/home_list_tile.dart';
import 'package:things_todo/core/resources/app_routes.dart';
import 'package:things_todo/core/widgets/app_loading_dialog.dart';
import 'package:things_todo/core/widgets/app_options_dialog.dart';
import 'package:things_todo/core/widgets/constant_global_widgets.dart';
import 'package:things_todo/core/widgets/loading_on_strings.dart';
import 'package:things_todo/generated/l10n.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).homepage),
        ),
        body: ListView(
          padding: appVerticalPadding.copyWith(top: 10),
          children: [
            Obx(
              () => controller.isLoading.value
                  ? const LoadingOnStrings()
                  : HomeListTile.userInfo(
                      icon: Icons.person_outline_rounded,
                      title: controller.getUserName(),
                    ),
            ),
            Obx(
              () => controller.isLoading.value
                  ? const LoadingOnStrings()
                  : HomeListTile.userInfo(
                      icon: Icons.phone_iphone,
                      title: controller.getPhoneNumber(),
                    ),
            ),
            Obx(
              () => controller.isLoading.value
                  ? const LoadingOnStrings()
                  : HomeListTile.userInfo(
                      icon: Icons.mail_outline,
                      title: controller.getEmail(),
                    ),
            ),
            HomeListTile.option(
              title: AppLocalizations.of(context).updateInformation,
              onTap: () async => await Get.toNamed(
                AppRoutes.updateInformationRoute,
              ),
            ),
            HomeListTile.option(
              title: AppLocalizations.of(context).changePassword,
              onTap: () async => await Get.toNamed(
                AppRoutes.changePasswordRoute,
              ),
            ),
            HomeListTile.option(
              title: AppLocalizations.of(context).deleteAccount,
              onTap: () async {
                await showWarningDialog(
                  context: context,
                  action: () {
                    Get.back();
                    controller.deleteUser();
                    showAppLoadingDialog(context);
                  },
                  content: AppLocalizations.of(context)
                      .areYouSureThatYouWantToDeleteYourAccount,
                );
              },
            ),
            HomeListTile.option(
              title: AppLocalizations.of(context).logout,
              onTap: () async {
                await showWarningDialog(
                  context: context,
                  action: () {
                    Get.back();
                    controller.logout();
                    showAppLoadingDialog(context);
                  },
                  content: AppLocalizations.of(context)
                      .areYouSureThatYouWantToLogout,
                );
              },
            ),
          ],
        ),
      );
}
