import 'package:task/core/app_utils/app_fonts.dart';

import 'app_extensions.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyle {
  static const String mainArFont = AppFonts.fontFamily;

  static TextStyle get hintTextStyle =>
      TextStyle(fontSize: 11.0.sp, fontWeight: FontWeight.normal, color: AppColors.primary);

  static TextStyle get hintSmallTextStyle =>
      TextStyle(fontSize: 10.0.sp, fontWeight: FontWeight.normal, color: AppColors.primary);

  static TextStyle get headline1 => TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold);

  static TextStyle get headline2 => TextStyle(fontSize: 15.0.sp, fontWeight: FontWeight.bold);

  static TextStyle get appBarTitleStyle => TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600);

  static TextStyle get normal =>
      TextStyle(fontSize: 12.0.sp, fontWeight: FontWeight.w600, height: 1.5);

  static TextStyle get listTextStyle => TextStyle(fontSize: 8.5.sp, fontWeight: FontWeight.w600);

  static TextStyle getTextStyle(
      double fontSize,
      FontWeight fontWeight,
      Color color,
      TextDecoration decoration

      ) {
    return TextStyle(
        fontSize: fontSize,
        fontFamily: mainArFont,
        color: color,
        fontWeight: fontWeight,
        decoration: decoration
    );
  }

// regular style

  static TextStyle getRegularStyle(
      {double fontSize = 12, required Color color, double height = 1.2,TextDecoration decoration=TextDecoration.none}) {
    return getTextStyle(fontSize, FontWeight.w400, color,decoration);
  }

// bold style

  static TextStyle getBoldStyle({double fontSize = 12, required Color color,TextDecoration decoration=TextDecoration.none}) {
    return getTextStyle(fontSize, FontWeight.w800, color,decoration);
  }
}
