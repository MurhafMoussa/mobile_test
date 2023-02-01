import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:things_todo/core/resources/color_manager.dart';
import 'package:things_todo/core/resources/text_style_manager.dart';
import 'package:things_todo/core/widgets/constant_global_widgets.dart';
import 'package:things_todo/generated/l10n.dart';

class AppFilledButton extends StatelessWidget {
  const AppFilledButton({
    super.key,
    required this.onPressed,
    required this.content,
  });
  final VoidCallback onPressed;
  final Widget content;
  @override
  Widget build(BuildContext context) => FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: appLargeBorderRaduis,
          ),
        ),
        child: content,
      ).withWidth(double.infinity).withHeight(60);
}
