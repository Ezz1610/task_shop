import 'dart:async';
import 'package:task/core/app_utils/app_colors.dart';
import 'package:task/core/app_utils/app_navigator.dart';
import 'package:task/core/app_utils/app_prefs.dart';
import 'package:task/core/app_utils/media_query_values.dart';
import 'package:task/core/dependency_injection/dependency_injection.dart';
import 'package:task/features/auth/presentation/screens/user_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:task/features/home/presentation/screens/main_screen.dart';

import 'core/app_utils/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const id = 'SplashScreen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    dPrint("test11111111111");
    Timer(const Duration(seconds: 2), () => goToHomeScreen());
    dPrint("test2222222222");

    super.initState();
  }



  goToHomeScreen() async {
    dPrint("test3333333333");
    final appPref = getIt<AppPreferences>();

    // appPref.adminId = '192.168.1.3';
     dPrint("from splash ${appPref.userDataInfo == null}");
    if (appPref.userDataInfo == null) {
      AppNavigator.navigateAndFinish(context: context, screen: UserLoginScreen.id);
    } else {
      AppNavigator.navigateAndFinish(context: context, screen: MainScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.backgroundColor,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  AppImageAssets.logo,

                ),
              ),
              SizedBox(
                height: h * 0.2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
