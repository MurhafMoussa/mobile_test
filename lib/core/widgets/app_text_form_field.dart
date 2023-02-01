import 'package:flutter/material.dart';
import 'package:things_todo/core/resources/text_style_manager.dart';

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
  final IconButton? suffixIcon;
  final String? Function(String?) validator;
  final TextInputType textInputType;
  final String hintText;
  final IconButton? prefixIcon;
  final TextInputAction textInputAction;
  @override
  Widget build(BuildContext context) => TextFormField(
        controller: textEditingController,
        obscureText: passwordVisibility,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: getBodyTextStyle(),
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: textInputAction,
        decoration: InputDecoration(
            hintText: hintText, prefixIcon: prefixIcon, suffixIcon: suffixIcon,),
        validator: validator,);
}
