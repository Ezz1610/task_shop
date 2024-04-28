
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/app_business_logic/app_cubit/app_cubit.dart';
import 'package:task/core/app_business_logic/enums.dart';
import 'package:task/core/app_utils/app_fonts.dart';
import 'package:task/core/app_utils/app_navigator.dart';
import 'package:task/splash_screen.dart';


class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        AppCubit.get(context).changeLang();
        AppNavigator.navigateAndReplace(
            context: context, screen: SplashScreen.id);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            translator(
                arabicWord: 'حسابك', englishWord: 'Account'),
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.fontFamily),
          ),
        ],
      ),
    );
  }














}
