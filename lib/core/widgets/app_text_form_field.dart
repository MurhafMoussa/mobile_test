import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.textEditingController,
    this.passwordVisibility = false,
    this.suffixIcon,
    required this.validator,
    this.textInputType = TextInputType.text,
    required this.hintText,
    this.prefixIcon,
    this.textInputAction = TextInputAction.done,
  });
  final TextEditingController textEditingController;
  final bool passwordVisibility;
  final Widget? suffixIcon;
  final String? Function(String?) validator;
  final TextInputType textInputType;
  final String hintText;
  final Widget? prefixIcon;
  final TextInputAction textInputAction;
  @override
  Widget build(BuildContext context) => TextFormField(
        controller: textEditingController,
        obscureText: passwordVisibility,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
        validator: validator,
      );
}
