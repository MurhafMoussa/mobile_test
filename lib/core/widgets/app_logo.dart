import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:things_todo/core/resources/assets_manager.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) => Image.asset(
        AssetsManager.logo,
        height: 150,
        width: 150,
      ).paddingSymmetric(horizontal: 20);
}
