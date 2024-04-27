import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/app.dart';
import 'package:task/core/app_utils/app_colors.dart';
import 'package:task/core/app_utils/app_navigator.dart';
import 'package:task/core/app_utils/app_prefs.dart';
import 'package:task/core/app_utils/media_query_values.dart';
import 'package:task/core/components/components.dart';
import 'package:task/core/dependency_injection/dependency_injection.dart';
import 'package:task/features/home/domain/model/home_model/home_model.dart';
import 'package:task/features/home/presentation/cubit/more_products_cubit.dart';
import 'package:task/features/home/presentation/screens/more_products_screen/more_products_screen.dart';

import 'product_item.dart';

class BuildGridProduct extends StatelessWidget{
  final HomeDM homeDM;
   BuildGridProduct({Key? key, required this.homeDM}):super(key: key);

  @override
  Widget build(BuildContext context) {
    dPrint("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${homeDM.products!.length}");
    // TODO: implement build
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        myDivider(),
         Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(
                App.tr.products,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              InkWell(
                onTap: (){
               getIt<MoreProductsCubit>().getMoreProductsData(
                        authKey: getIt<AppPreferences>().userDataInfo!.authKey,
                        userId: getIt<AppPreferences>().userDataInfo!.id

                  );
                  // AppNavigator.navigateTo(context: context, screen: MoreProductScreen.id);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.mainColor
                  ),
                  child: Text(App.tr.more),),
              )
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: GridView.count(
            shrinkWrap: true,
            physics:  const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: .8,
            children: List.generate(
              homeDM.products!.length,//length of list
                  (index) =>ProductItem(productDM: homeDM.products![index],),
            ),

          ),
        ),
      ],
    );
  }

}