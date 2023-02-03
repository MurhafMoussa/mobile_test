import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:things_todo/generated/l10n.dart';

Future<void> showWarningDialog({
  required BuildContext context,
  required VoidCallback action,
  required String content,
}) async {
  await AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    animType: AnimType.bottomSlide,
    title: AppLocalizations.of(context).warning,
    desc: content,
    btnCancelOnPress: () {
      Get.back();
    },
    btnOkText:AppLocalizations.of(context).yes,
    btnOkOnPress: action,
  ).show();
}
