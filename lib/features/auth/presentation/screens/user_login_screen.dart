import 'package:get/get.dart';
import 'package:task/app.dart';
import 'package:task/core/app_utils/app_assets.dart';
import 'package:task/core/app_utils/app_text_style.dart';
import 'package:task/core/app_utils/app_validation.dart';
import 'package:task/core/app_utils/media_query_values.dart';
import 'package:task/features/home/presentation/cubit/home_cubit.dart';
import 'package:task/features/home/presentation/screens/main_screen.dart';
import '../../../../core/app_business_logic/state_renderer/request_builder.dart';
import '../../../../core/app_business_logic/state_renderer/state_renderer_impl.dart';
import '../../../../core/app_utils/app_extensions.dart';
import '../../../../core/app_utils/app_navigator.dart';
import '../../../../core/app_utils/app_strings.dart';
import '../../../../core/app_widgets/custom_button.dart';
import '../../../../core/app_widgets/custom_text_form_field.dart';
import '../../../../core/dependency_injection/dependency_injection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_utils/app_colors.dart';
import '../cubit/user_login_cubit.dart';

class UserLoginScreen extends StatefulWidget {
  static const id = AppStrings.userLoginScreen;

  const UserLoginScreen({Key? key}) : super(key: key);

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  var userEmailController =
       TextEditingController(text: kDebugMode?"aboelazm111@gmail.com":"");
   var passwordController =
       TextEditingController(text: kDebugMode?"123456":"");

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child:  _apiRequestBuilder(),
        ),
      ),
    );
  }

  _apiRequestBuilder() {
    return BlocProvider(
      create: (context) => getIt<UserLogInCubit>(),
      child: RequestBuilder<UserLogInCubit>(
        contentBuilder: (context, cubit) {
          return buildScreenContent(cubit);
        },
        retry: (context, cubit) {},
        listener: (context, cubit) {
          if (cubit.state is SuccessState) {
            dPrint("state is SuccessState");
            AppNavigator.navigateAndFinish(
                context: context, screen: MainScreen.id);
          }
        },
      ),
    );
  }


  buildScreenContent(UserLogInCubit cubit) {
    return Padding(
      padding:   EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
                width: 80,
                height: 80,
                image: AssetImage(AppImageAssets.logo)),
            const SizedBox(
              height: 10,
            ),
            Text(
              "مرحباً بك",
              style: AppTextStyle.getBoldStyle(color: AppColors.black,fontSize: 22)
            ),
            const SizedBox(
              height: 20,
            ),
          CustomTextField(
              width: 70.w,
              color: Colors.white,
              controller: userEmailController,
              type: TextInputType.emailAddress,
              hint: App.tr.emailAddress,
              validator: (String? value) {
                return Validations.deviceValidation(value);
              }
          ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
                width: 70.w,
                // hi: 1.w,
                color: Colors.white,
                obscure: cubit.isPassword,
                suffix: cubit.suffix,
                visiblpass: cubit.changePasswordVisibility,
                controller: passwordController,
                prefix: Icons.lock_outlined,
                type: TextInputType.visiblePassword,
                hint: App.tr.password,
                validator: (String? value) {
                  return Validations.deviceValidation(value);
                }),
            CustomButton(
                borderColor: AppColors.white,
                buttonColor: AppColors.mainColor,
                fontSize: 20.sp,
                titleColor: Colors.white,
                width: 70.w,
                height: 7.h,
                radius: .5,
                title: App.tr.login,
                onTap: () {

                  if (formKey.currentState!.validate()) {
                    cubit.getUserLoginDataInfo(
                      email: userEmailController.text,
                      password: passwordController.text,
                    );
                    dPrint(userEmailController.text);
                    dPrint(passwordController.text);
                  }
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: (){},
                  child:  Text(
                    'نسيت كلمة المرور',
                    style: AppTextStyle.getRegularStyle(color: AppColors.grey),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'ليس لديك حساب؟ ',
                ),
                TextButton(
                  onPressed: (){},
                  child: const Text(
                    'سجل الأن',
                  ),
                ),
              ],
            ),
           //  Column(children: [
           //   Text("Or Sing in With"),
           //   // Row(children: [
           //   //   // Image(
           //   //   //     width: 30,
           //   //   //     height: 30,
           //   //   //     image:  const AssetImage(AppImageAssets.google)),
           //   //   // Image(
           //   //   //     width: 30,
           //   //   //     height: 30,
           //   //   //     image: const AssetImage(AppImageAssets.apple)),
           //   //   // Image(
           //   //   //
           //   //   //     width: 30,
           //   //   //     height: 30,
           //   //   //     image: const AssetImage(AppImageAssets.facebook)),
           //   // ],)
           // ],)
          ],
        ),
      ),
    );
  }

  void _hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
