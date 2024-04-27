
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/app_business_logic/app_cubit/app_cubit.dart';
import 'package:task/core/app_business_logic/enums.dart';
import 'package:task/core/app_utils/app_fonts.dart';
import 'package:task/core/app_utils/app_navigator.dart';
import 'package:task/splash_screen.dart';


class SettingsScreen extends StatelessWidget {
  var namedController=TextEditingController();
var emailController=TextEditingController();
var phoneController=TextEditingController();

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
          const Icon(
              Icons.language
          ),
          Text(
            translator(
                arabicWord: 'العربية', englishWord: 'English'),
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
