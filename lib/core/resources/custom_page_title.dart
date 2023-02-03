import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:things_todo/core/resources/font_manager.dart';

class CustomPageTitle extends StatelessWidget {
  const CustomPageTitle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) => Text(
        text,
        style: context.textTheme.bodyLarge?.copyWith(
          fontSize: FontSizesManager.s26,
        ),
      );
}
