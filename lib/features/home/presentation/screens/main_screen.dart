

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/app.dart';
import 'package:task/core/app_business_logic/state_renderer/request_builder.dart';
import 'package:task/core/app_business_logic/state_renderer/state_renderer_impl.dart';
import 'package:task/core/app_utils/app_assets.dart';
import 'package:task/core/app_utils/app_colors.dart';
import 'package:task/core/app_utils/app_navigator.dart';
import 'package:task/core/app_utils/app_prefs.dart';
import 'package:task/core/app_utils/app_strings.dart';
import 'package:task/core/app_utils/app_text_style.dart';
import 'package:task/core/app_utils/media_query_values.dart';
import 'package:task/core/dependency_injection/dependency_injection.dart';
import 'package:task/features/home/presentation/cubit/home_cubit.dart';

import '../../../../core/components/components.dart';
import 'search/search_screen.dart';

class MainScreen extends StatefulWidget {
  static const id = AppStrings.mainScreen;

  const  MainScreen({super.key,});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _appPreferences=getIt<AppPreferences>();
@override
  void initState(){


  super.initState();
}

//bool isPassword=true;
  @override
  Widget build(BuildContext context) {
   var userData= getIt<AppPreferences>().userDataInfo;
  dPrint("ddddddddddddddd1${getIt<AppPreferences>().token}");
  dPrint("ddddddddddddddd2${userData!.name}");
   // create: (context) => getIt<HomeCubit>()..getHomeData(
   //     authKey: _appPreferences.userDataInfo!.authKey,
   //     userId: _appPreferences.userDataInfo!.id),
   return  BlocProvider(
     create: (context) => getIt<HomeCubit>()..getHomeData(
         authKey: _appPreferences.userDataInfo!.authKey,
         userId: _appPreferences.userDataInfo!.id),
     child: Scaffold(
         appBar: AppBar(
           title: const Text(
             "Ezz Market",
           ),
           actions: [
             IconButton(
               onPressed: (){
                 AppNavigator.navigateTo(context: context, screen: SearchScreen.id);
               },
               icon: const Icon(
                 Icons.search,
               ),
             ),
           ],
         ),
         body:_screens() ,
         bottomNavigationBar: _apiRequestBuilder()
     ),
   );
  }
  _apiRequestBuilder() {
    return RequestBuilder<HomeCubit>(
      contentBuilder: (context, cubit) {

        dPrint("cubit.currentIndex is : ${cubit.currentIndex}");
        return Directionality(
          textDirection: TextDirection.ltr,
          child: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            fixedColor: AppColors.mainColor,
            unselectedItemColor:AppColors.grey,
            unselectedFontSize:14,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items:
            navBarItems(
              icon1: Image(
                  width: 30,
                  height: 30,
                  image: AssetImage(AppImageAssets.home)),
              icon2: Image(
                  width: 30,
                  height: 30,
                  image: AssetImage(AppImageAssets.bottom1)),
              icon3: Image(
              width: 30,
              height: 30,
                image: AssetImage(AppImageAssets.cart)),
              icon4: Image(
              width: 30,
              height: 30,
          image: AssetImage(AppImageAssets.fav)),
              icon5: Image(
              width: 30,
              height: 30,
          image: AssetImage(AppImageAssets.account)),

            ),

            onTap: (index){
              cubit.changeIndex(index);
            },
          ),
        );
      },
      retry: (context, cubit) {},
      listener: (context, cubit) {
        if (cubit.state is SuccessState) {
          dPrint("state is SuccessState");

        }
      },
    );
  }
  // getIt<HomeCubit>()..getHomeData(
  // authKey: _appPreferences.userDataInfo!.authKey,
  // userId: _appPreferences.userDataInfo!.id),
  _screens() {
    return RequestBuilder<HomeCubit>(
      contentBuilder: (context, cubit) {
        return cubit.screens[cubit.currentIndex];
      },
      retry: (context, cubit) {},
      listener: (context, cubit) {
        if (cubit.state is SuccessState) {
          dPrint("state is SuccessState");

        }
      },
    );

  }


}
