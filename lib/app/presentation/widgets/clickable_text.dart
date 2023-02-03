import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:things_todo/core/resources/color_manager.dart';
import 'package:things_todo/core/resources/font_manager.dart';

class ClickableText extends StatelessWidget {
  const ClickableText({
    super.key,
    required this.content,
    required this.contentToBeClicked,
    this.onTappingContent,
  });
  final String content;
  final String contentToBeClicked;
  final Function(TapDragDownDetails)? onTappingContent;
  @override
  Widget build(BuildContext context) => Text.rich(
        TextSpan(
          text: content,
          style: context.textTheme.bodyMedium?.copyWith(
            color: ColorManager.gray,
          ),
          children: [
            TextSpan(
              text: contentToBeClicked,
              recognizer: TapAndDragGestureRecognizer()
                ..onTapDown = onTappingContent,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      );
}
