import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:things_todo/core/resources/color_manager.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget._({required this.color});
  factory AppLoadingWidget.light() => const AppLoadingWidget._(
        color: ColorManager.white,
      );
  factory AppLoadingWidget.dark() => const AppLoadingWidget._(
        color: ColorManager.primary,
      );
  final Color color;
  @override
  Widget build(BuildContext context) => SpinKitWave(
        color: color,
        size: 25,
      );
}
