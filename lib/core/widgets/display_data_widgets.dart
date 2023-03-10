import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:things_todo/core/resources/color_manager.dart';
import 'package:things_todo/core/resources/font_manager.dart';
import 'package:things_todo/core/widgets/constant_global_widgets.dart';
import 'package:things_todo/generated/l10n.dart';

void showSucessSnackBar(String msg, BuildContext context) {
  final SnackBar snackBar = _customSnackBar(
    context,
    msg,
    AppLocalizations.of(context).success,
    ColorManager.lightGreen,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showErrorSnackBar(String msg, BuildContext context) {
  final SnackBar snackBar = _customSnackBar(
    context,
    msg,
    AppLocalizations.of(context).failure,
    ColorManager.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

SnackBar _customSnackBar(
  BuildContext context,
  String msg,
  String title,
  Color backgroundColor,
) =>
    SnackBar(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
          ),
          Text(
            msg,
            style: GoogleFonts.alexandria(
              color: ColorManager.white,
              fontWeight: FontWeight.w400,
              fontSize: FontSizesManager.s10,
            ),
          ),
        ],
      ),
      elevation: 2,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shape: const RoundedRectangleBorder(borderRadius: appLargeBorderRaduis),
      showCloseIcon: false,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
      backgroundColor: backgroundColor,
    );
