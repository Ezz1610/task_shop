import 'package:flutter/material.dart';

class AppNavigator {
  static navigateAndFinish(
      {required BuildContext context, required String screen,Object? arguments}) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(screen, (Route<dynamic> route) => false,arguments: arguments);
  }

  static navigateBack({required BuildContext context,Object? arguments}) {
    Navigator.canPop(context,) ? Navigator.pop(context,arguments) : null;
  }

  static navigateTo(
      {required BuildContext context,
      required String screen,
      Object? arguments}) {
    Navigator.pushNamed(context, screen, arguments: arguments);
  }

  static navigateAndReplace(
      {required BuildContext context,
      required String screen,
      Object? arguments}) {
    Navigator.pushReplacementNamed(context, screen, arguments: arguments);
  }
}
