import 'package:flutter/material.dart';
import 'package:test_task/shared/config/theme/colors.dart';

ThemeData theme = ThemeData(
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  hoverColor: Colors.transparent,
  canvasColor: Colors.transparent,
  extensions: [
    AppColorsExtension(
        black: AppPalette.black,
        grey1: AppPalette.grey1,
        grey2: AppPalette.grey2,
        grey3: AppPalette.grey3,
        grey4: AppPalette.grey4,
        grey5: AppPalette.grey5,
        grey6: AppPalette.grey6,
        grey7: AppPalette.grey7,
        white: AppPalette.white,
        blue: AppPalette.blue,
        darkBlue: AppPalette.darkBlue,
        green: AppPalette.green,
        darkGreen: AppPalette.darkGreen,
        red: AppPalette.red,
        orange: AppPalette.orange),
  ],
  bottomSheetTheme:
  const BottomSheetThemeData(surfaceTintColor: Colors.transparent),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.white,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w600),
    displayMedium: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w600),
    displaySmall: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.normal),
    labelSmall: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic),
  ),
);