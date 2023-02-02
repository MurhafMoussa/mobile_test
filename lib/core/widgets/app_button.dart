import 'package:flutter/material.dart';
import 'package:things_todo/core/extensions/widget%20_extensions.dart';

class AppButton extends StatelessWidget {
  factory AppButton.filled({
    required VoidCallback onPressed,
    required Widget content,
  }) =>
      AppButton._(_ButtonType.filled, onPressed: onPressed, content: content);
  factory AppButton.outlined({
    required VoidCallback onPressed,
    required Widget content,
  }) =>
      AppButton._(_ButtonType.outlined, onPressed: onPressed, content: content);

  const AppButton._(
    this._buttonType, {
    required this.onPressed,
    required this.content,
  });
  final VoidCallback onPressed;
  final Widget content;
  final _ButtonType _buttonType;
  @override
  Widget build(BuildContext context) {
    switch (_buttonType) {
      case _ButtonType.filled:
        return FilledButton(
          onPressed: onPressed,
          child: content,
        ).withHeightAndWidth(
          height: 60,
          width: double.infinity,
        );

      case _ButtonType.outlined:
        return OutlinedButton(
          onPressed: onPressed,
          child: content,
        ).withHeightAndWidth(
          height: 60,
          width: double.infinity,
        );
    }
  }
}

enum _ButtonType {
  filled,
  outlined,
}
