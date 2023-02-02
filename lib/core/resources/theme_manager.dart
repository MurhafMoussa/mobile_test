import 'package:flutter/material.dart';
import 'package:things_todo/core/resources/color_manager.dart';
import 'package:things_todo/core/resources/font_manager.dart';
import 'package:things_todo/core/resources/text_style_manager.dart';
import 'package:things_todo/core/widgets/constant_global_widgets.dart';
import 'package:things_todo/core/widgets/outline_input_border_based_on_color.dart';

ThemeData getApplicationThemeData({required bool isDark}) => isDark
    ? ThemeData.dark().copyWith()
    : ThemeData.light().copyWith(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: ColorManager.primary,
          onPrimary: ColorManager.white,
          secondary: ColorManager.white,
          onSecondary: ColorManager.primary,
          error: ColorManager.red,
          onError: ColorManager.white,
          background: ColorManager.scaffoldBackgroundColor,
          onBackground: ColorManager.white,
          surface: ColorManager.white,
          onSurface: ColorManager.primary,
        ),
        cardTheme:
            const CardTheme(elevation: 0, shadowColor: ColorManager.gray),
        appBarTheme: const AppBarTheme(
          color: ColorManager.primary,
          centerTitle: false,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        textTheme: TextTheme(
          labelLarge: getNormalTitleTextStyle(),
        ),
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
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
            errorBorder: customOutlineInputBorder(ColorManager.red),
            focusedBorder: customOutlineInputBorder(ColorManager.primary),
            enabledBorder: customOutlineInputBorder(ColorManager.gray),
            focusedErrorBorder: customOutlineInputBorder(ColorManager.red),
            hintStyle:
                getSmallTitleTextStyle().copyWith(color: ColorManager.gray),
            errorStyle: getErrorTextStyle()),
        outlinedButtonTheme: const OutlinedButtonThemeData(
          style: ButtonStyle(
            side: MaterialStatePropertyAll(
              BorderSide(
                color: ColorManager.primary,
              ),
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: appLargeBorderRaduis,
              ),
            ),
          ),
        ),
        filledButtonTheme:const FilledButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: appLargeBorderRaduis,
                ),
              ),
             ),
        ),
      );
