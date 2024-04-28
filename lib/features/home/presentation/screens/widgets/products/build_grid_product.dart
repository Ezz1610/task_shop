import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/app.dart';
import 'package:task/core/app_utils/app_colors.dart';
import 'package:task/core/app_utils/app_navigator.dart';
import 'package:task/core/app_utils/app_prefs.dart';
import 'package:task/core/app_utils/app_text_style.dart';
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
          child: Directionality(
            
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                Text(
                  App.tr.products,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: (){
                    AppNavigator.navigateTo(context: context, screen: MoreProductScreen.id);
                  },
                  child: Container(
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                        child: Text(App.tr.more,
                          style: AppTextStyle.getBoldStyle(
                              color: AppColors.white,fontSize: 18),)),),
                )
              ],
            ),
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