import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  SizedBox withWidth(double width) => SizedBox(
        width: width,
        height: 0,
        child: this,
      );
  SizedBox withHeight(double height) => SizedBox(
        width: 0,
        height: height,
        child: this,
      );
  SizedBox withHeightAndWidth({
    required double height,
    required double width,
  }) =>
      SizedBox(
        width: width,
        height: height,
        child: this,
      );
}
