import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

enum AppTheme {
  lightAppTheme,
  darkAppTheme,
}

final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.darkAppTheme: ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.redAccent,
      textTheme: const TextTheme(),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.white,
              statusBarColor: AppColors.backgroundColor,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark // status bar color
              ))),
  AppTheme.lightAppTheme: ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.greenAccent,
    textTheme: const TextTheme(
      displaySmall: TextStyle(color: Colors.green, fontSize: 18),
      headlineMedium: TextStyle(color: Colors.greenAccent, fontSize: 18),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.white,
            statusBarColor: AppColors.backgroundColor,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark // status bar color
            )),
  ),
};

// in material app   theme: Styles.themeData(false),

// class Styles {
//   static ThemeData themeData(bool isDarkTheme) {
//     return ThemeData(
//         // fontFamily: AppTextStyle.mainArFont,
//         // primarySwatch: AppColors.mainColor.getMaterialColor(),
//         // appBarTheme: const AppBarTheme(
//         //     backgroundColor: Colors.transparent,
//         //     elevation: 0,
//         //     systemOverlayStyle: SystemUiOverlayStyle(
//         //         systemNavigationBarColor: Colors.white,

//         //         // navigation bar color
//         //         statusBarColor: AppColors.statusBarColorTransparent,
//         //         statusBarBrightness: Brightness.light,
//         //         statusBarIconBrightness: Brightness.light // status bar color
//         //         ))
//         // primaryColor: isDarkTheme ? Colors.black : Colors.white,
//         //
//         // backgroundColor: isDarkTheme ? Colors.black : AppColors.appBackground,
//         // scaffoldBackgroundColor: isDarkTheme ? Colors.black : AppColors.appBackground,
//         //
//         // indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
//         // buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
//         //
//         // hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
//         //
//         // highlightColor: isDarkTheme ? Color(0xff372901) : Color(0x640b9490),
//         // hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
//         //
//         // focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
//         // disabledColor: Colors.grey,
//         // // textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
//         // cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
//         // canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
//         // brightness: isDarkTheme ? Brightness.dark : Brightness.light,
//         // // buttonTheme: Theme.of(context).buttonTheme.copyWith(
//         // //     colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
//         // appBarTheme: AppBarTheme(
//         //   elevation: 0.0,
//         // ),
//         );
//   }
// }
