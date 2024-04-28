

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/app.dart';
import 'package:task/core/app_business_logic/state_renderer/request_builder.dart';
import 'package:task/core/app_business_logic/state_renderer/state_renderer.dart';
import 'package:task/core/app_business_logic/state_renderer/state_renderer_impl.dart';
import 'package:task/core/app_utils/app_colors.dart';
import 'package:task/core/app_utils/app_navigator.dart';
import 'package:task/core/app_utils/app_prefs.dart';
import 'package:task/core/app_utils/app_strings.dart';
import 'package:task/core/app_utils/app_text_style.dart';
import 'package:task/core/app_utils/media_query_values.dart';
import 'package:task/core/dependency_injection/dependency_injection.dart';
import 'package:task/features/home/presentation/cubit/home_cubit.dart';
import 'package:task/features/home/presentation/cubit/more_products_cubit.dart';
import 'package:task/features/home/presentation/screens/widgets/more_products/build_grid_more_product.dart';

class MoreProductScreen extends StatefulWidget {
  static const id = AppStrings.moreProductScreen;

  const  MoreProductScreen({super.key,});

  @override
  State<MoreProductScreen> createState() => _MoreProductScreenState();
}

class _MoreProductScreenState extends State<MoreProductScreen> {
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
      create: (context) => getIt<MoreProductsCubit>()..getMoreProductsData(
          authKey: _appPreferences.userDataInfo!.authKey,
          userId: _appPreferences.userDataInfo!.id
      ),
      child: Scaffold(
          body:SafeArea(child: _apiRequestBuilder()) ,

          bottomNavigationBar: SafeArea(
            child: SizedBox(
              height: 60,
              child: RequestBuilder<MoreProductsCubit>(
                contentBuilder: (context,cubit){
                  if(cubit.state is PaginationLoadingState){
                    dPrint("pagiiiiiiiiiiiiiiii111111111");
                    return Center(child: CircularProgressIndicator(color: AppColors.mainColor,));
                  }else{
                    dPrint("pagiiiiiiiiiiiiiiii22222222");

                    return SizedBox.shrink();
                  }

                },
                retry: (context , cubit ) {  },
              ),
            ),
          ),
      ),
    );
  }
  _apiRequestBuilder() {
    return RequestBuilder<MoreProductsCubit>(
      contentBuilder: (context, cubit) {
        if(cubit.state is GetMoreProductLoadingState){
          dPrint("pagiiiiiiiiiiiiiiii111111111");
          return Center(child: CircularProgressIndicator(color: AppColors.mainColor,));
        }else{
          dPrint("pagiiiiiiiiiiiiiiii22222222");

          return NotificationListener<ScrollNotification>(
              onNotification: (notification){
                if(notification.metrics.pixels==notification.metrics.maxScrollExtent&&
                    notification is ScrollUpdateNotification
                ){
                  cubit.getMoreProductsData(
                      fromPagination: true,
                      authKey: _appPreferences.userDataInfo!.authKey,
                      userId: _appPreferences.userDataInfo!.id);
                }
                return true;
              },
              child: BuildGridMoreProducts(moreProductsDM: cubit.products,));
        }
      },
      retry: (context, cubit) {},
      listener: (context, cubit) {
      },
    );
  }



}
