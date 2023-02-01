// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:things_todo/core/resources/color_manager.dart';

import 'package:things_todo/core/resources/font_manager.dart';

TextStyle _getTextStyle(
  String fontFamily,
  FontWeight fontWeight,
  Color color,
  double fontSize,
) =>
    TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );

TextStyle _getRegularStyle({required Color color, required double fontSize}) =>
    _getTextStyle(
      FontFamily.fontFamily,
      FontWeightManager.regular,
      color,
      fontSize,
    );

TextStyle _getLightStyle({required Color color, required double fontSize}) =>
    _getTextStyle(
      FontFamily.fontFamily,
      FontWeightManager.light,
      color,
      fontSize,
    );

TextStyle _getBoldStyle({required Color color, required double fontSize}) =>
    _getTextStyle(
      FontFamily.fontFamily,
      FontWeightManager.bold,
      color,
      fontSize,
    );

TextStyle _getThinStyle({required Color color, required double fontSize}) =>
    _getTextStyle(
      FontFamily.fontFamily,
      FontWeightManager.thin,
      color,
      fontSize,
    );

TextStyle _getMediumStyle({required Color color, required double fontSize}) =>
    _getTextStyle(
      FontFamily.fontFamily,
      FontWeightManager.medium,
      color,
      fontSize,
    );

TextStyle _getBlackStyle({required Color color, required double fontSize}) =>
    _getTextStyle(
      FontFamily.fontFamily,
      FontWeightManager.black,
      color,
      fontSize,
    );

TextStyle getSmallTitleTextStyle() => _getRegularStyle(
      color: ColorManager.darkBlue,
      fontSize: FontSizesManager.s20,
    );

TextStyle getSubtitleTextStyle() => _getLightStyle(
      color: ColorManager.darkBlue,
      fontSize: FontSizesManager.s16,
    );

TextStyle getBodyTextStyle() => _getLightStyle(
      color: ColorManager.darkBlue,
      fontSize: FontSizesManager.s14,
    );

TextStyle getNormalTitleTextStyle() => _getBoldStyle(
      color: ColorManager.white,
      fontSize: FontSizesManager.s26,
    );

TextStyle getLargeTitleTextStyle() => _getBoldStyle(
      color: ColorManager.primary,
      fontSize: FontSizesManager.s36,
    );
