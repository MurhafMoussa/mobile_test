import 'package:flutter/material.dart';

class ColorManager {
  ColorManager._();
  static const Color primary = Color(0xff7646FF);
  static const Color secondary = Color(0xff6035D0);
  static const Color white = Color(0xffffffff);
  static const Color lightGreen = Color(0xff4CD964);
  static const Color red = Color(0xffF54439);
  static const Color pink = Color(0xffFC5565);
  static const Color blueAccent = Color(0xff58BBF7);
  static const Color orange = Color(0xffFA9B4A);
  static const Color yellow = Color(0xffFFEB3D);
  static const Color darkBlue = Color(0xff172735);
  static const Color gray = Color(0xff707070);
  static const Color scaffoldBackgroundColor = Color(0xffEFEFEF);
  static final List<Color> taskPriorities = <Color>[
    pink,
    orange,
    blueAccent,
    lightGreen,
  ];
}
