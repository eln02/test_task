import 'package:flutter/material.dart';

abstract class AppPalette {
  static const black = Color(0xFF0C0C0C);
  static const grey1 = Color(0xFF1D1E20);
  static const grey2 = Color(0xFF242529);
  static const grey3 = Color(0xFF2F3035);
  static const grey4 = Color(0xFF3E3F43);
  static const grey5 = Color(0xFF5E5F61);
  static const grey6 = Color(0xFF9F9F9F);
  static const grey7 = Color(0xFFDBDBDB);
  static const white = Color(0xFFFFFFFF);

  static const blue = Color(0xFF2261BC);
  static const darkBlue = Color(0xFF00427D);
  static const green = Color(0xFF3A633B);
  static const darkGreen = Color(0xFF1E341F);
  static const red = Color(0xFFFF5E5E);
  static const orange = Color(0xFFF36E36);
  //static const  = Color(0xFF);
}


class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    required this.black,
    required this.grey1,
    required this.grey2,
    required this.grey3,
    required this.grey4,
    required this.grey5,
    required this.grey6,
    required this.grey7,
    required this.white,
    required this.blue,
    required this.darkBlue,
    required this.green,
    required this.darkGreen,
    required this.red,
    required this.orange,
  });

  final Color black;
  final Color grey1;
  final Color grey2;
  final Color grey3;
  final Color grey4;
  final Color grey5;
  final Color grey6;
  final Color grey7;
  final Color white;
  final Color blue;
  final Color darkBlue;
  final Color green;
  final Color darkGreen;
  final Color red;
  final Color orange;

  @override
  ThemeExtension<AppColorsExtension> copyWith({

    Color? myColor1_1,
    Color? myColor2_2,
    Color? black_,
    Color? grey1_,
    Color? grey2_,
    Color? grey3_,
    Color? grey4_,
    Color? grey5_,
    Color? grey6_,
    Color? grey7_,
    Color? white_,
    Color? blue_,
    Color? darkBlue_,
    Color? green_,
    Color? darkGreen_,
    Color? red_,
    Color? orange_,
  }) {
    return AppColorsExtension(
      black: black_ ?? black,
      grey1: grey1_ ?? grey1,
      grey2: grey2_ ?? grey2,
      grey3: grey3_?? grey3,
      grey4: grey4_?? grey4,
      grey5: grey5_?? grey5,
      grey6: grey6_?? grey6,
      grey7: grey7_?? grey7,
      white: white_?? white,
      blue: blue_?? blue,
      darkBlue: darkBlue_?? darkBlue,
      green: green_?? green,
      darkGreen: darkGreen_?? darkGreen,
      red: red_?? red,
      orange: orange_?? orange,

    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
      covariant ThemeExtension<AppColorsExtension>? other,
      double t,
      ) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      black: Color.lerp(black, other.black, t)!,
      grey1: Color.lerp(grey1, other.grey1, t)!,
      grey2: Color.lerp(grey2, other.grey2, t)!,
      grey3: Color.lerp(grey3, other.grey3, t)!,
      grey4: Color.lerp(grey4, other.grey4, t)!,
      grey5: Color.lerp(grey5, other.grey5, t)!,
      grey6: Color.lerp(grey6, other.grey6, t)!,
      grey7: Color.lerp(grey7, other.grey7, t)!,
      white: Color.lerp(white, other.white, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      darkBlue: Color.lerp(darkBlue, other.darkBlue, t)!,
      green: Color.lerp(green, other.green, t)!,
      darkGreen: Color.lerp(darkGreen, other.darkGreen, t)!,
      red: Color.lerp(red, other.red, t)!,
      orange: Color.lerp(orange, other.orange, t)!,
    );
  }
}

extension AppColors on ThemeData {
  AppColorsExtension get appColors => extension<AppColorsExtension>()!;
}