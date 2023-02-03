import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:things_todo/core/resources/color_manager.dart';
import 'package:things_todo/core/resources/font_manager.dart';
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
          onSurface: ColorManager.primary,
          surface: ColorManager.white,
        ),
        cardTheme: const CardTheme(
          elevation: 0.5,
          shadowColor: ColorManager.gray,
          shape: RoundedRectangleBorder(
            borderRadius: appSmallBorderRaduis,
          ),
        ),
        appBarTheme: AppBarTheme(
          color: ColorManager.primary,
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          titleTextStyle: GoogleFonts.alexandria(
            fontSize: FontSizesManager.s20,
          ),
          iconTheme: const IconThemeData(
            color: ColorManager.white,
             
          ),
        ),
        textTheme: GoogleFonts.alexandriaTextTheme().copyWith(
          // text style for buttons ex : textbutton , outlined ..
          labelLarge: GoogleFonts.alexandria(
            fontSize: FontSizesManager.s20,
          ),
          //for text inputs and list tile title
          bodyLarge: GoogleFonts.alexandria(
            fontSize: FontSizesManager.s20,
            color: ColorManager.primary,
          ),
          //the normal text in the scaffold body and list tile subtitle
          bodyMedium: GoogleFonts.alexandria(
            color: ColorManager.primary,
          ),
          // for error text and small text in the scaffold body
          bodySmall: GoogleFonts.alexandria(
            fontSize: FontSizesManager.s10,
          ),

          //for hint text
          titleMedium: GoogleFonts.alexandria(
            color: ColorManager.gray,
          ),
        ),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          errorBorder: customOutlineInputBorder(ColorManager.red),
          focusedBorder: customOutlineInputBorder(ColorManager.primary),
          enabledBorder: customOutlineInputBorder(ColorManager.gray),
          focusedErrorBorder: customOutlineInputBorder(ColorManager.red),
          prefixIconColor: ColorManager.primary,
        ),
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
        filledButtonTheme: const FilledButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: appLargeBorderRaduis,
              ),
            ),
          ),
        ),
      );
