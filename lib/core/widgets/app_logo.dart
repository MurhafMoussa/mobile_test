import 'package:flutter/material.dart';
import 'package:things_todo/core/resources/assets_manager.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key,  this.scaleFactor=1});
  final double scaleFactor;
  @override
  Widget build(BuildContext context) => Transform.scale(
      scale: scaleFactor,
      child: Image.asset(
        AssetsManager.logo,
      ),
    );
}
