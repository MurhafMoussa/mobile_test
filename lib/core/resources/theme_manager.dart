import 'package:flutter/material.dart';
import 'package:things_todo/core/resources/color_manager.dart';
import 'package:things_todo/core/resources/text_style_manager.dart';

ThemeData getApplicationThemeData({required bool isDark}) => isDark
    ? ThemeData.dark().copyWith()
    : ThemeData.light().copyWith(
        primaryColor: ColorManager.primary,
        iconTheme: const IconThemeData(color: ColorManager.white),
        cardTheme:
            const CardTheme(elevation: 0, shadowColor: ColorManager.gray),
        appBarTheme: const AppBarTheme(
          color: ColorManager.primary,
          iconTheme: IconThemeData(color: ColorManager.white),
          centerTitle: false,
          elevation: 0,
          scrolledUnderElevation: 0,
          actionsIconTheme: IconThemeData(
            color: ColorManager.white,
          ),
        ),
        scaffoldBackgroundColor: ColorManager.scaffoldBackgroundColor,
        tabBarTheme: TabBarTheme(
          labelStyle: getNormalTitleTextStyle(),
          unselectedLabelStyle: getSmallTitleTextStyle(),
          indicator: const BoxDecoration(
            color: ColorManager.primary,
            border: Border(
              bottom: BorderSide(color: ColorManager.white, width: 5),
            ),
          ),
        ),
        listTileTheme: ListTileThemeData(
          titleTextStyle: getSmallTitleTextStyle(),
          subtitleTextStyle: getSubtitleTextStyle(),
        ),
      );
