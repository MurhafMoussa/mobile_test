
import 'package:flutter/material.dart';
import 'package:things_todo/core/resources/color_manager.dart';

class PasswordIcon extends StatelessWidget {
  const PasswordIcon({
    super.key, required this.changeVisibility, required this.visible,
  });

  final VoidCallback changeVisibility;
  final bool visible;
  @override
  Widget build(BuildContext context)  => IconButton(
      onPressed: changeVisibility,
      icon: Icon(
       visible
            ? Icons.visibility_off
            : Icons.visibility,
        color: visible
            ? ColorManager.gray
            : ColorManager.primary,
      ),
    );
}
