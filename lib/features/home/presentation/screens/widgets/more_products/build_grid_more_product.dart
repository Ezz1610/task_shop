import 'package:flutter/material.dart';
import 'package:task/app.dart';
import 'package:task/core/app_utils/app_colors.dart';
import 'package:task/core/app_utils/app_navigator.dart';
import 'package:task/core/app_utils/media_query_values.dart';
import 'package:task/core/components/components.dart';
import 'package:task/features/home/domain/model/home_model/home_model.dart';
import 'package:task/features/home/domain/model/more_products_model/more_product_model.dart';
import 'package:task/features/home/domain/model/more_products_model/more_products_model.dart';

import 'more_product_item.dart';

class BuildGridMoreProducts extends StatelessWidget{
  final List<MoreProductDM> moreProductsDM;
   BuildGridMoreProducts({Key? key, required this.moreProductsDM}):super(key: key);

  @override
  Widget build(BuildContext context) {
    dPrint("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${moreProductsDM.length}");
    // TODO: implement build
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          myDivider(),
           Directionality(
             textDirection: TextDirection.rtl,
             child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    App.tr.products,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Spacer(),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Container(
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                          child: IconButton(icon: Icon(
                            Icons.arrow_back,
                            color: AppColors.white,
                          ), onPressed: () {
                            AppNavigator.navigateBack(context: context);
                          },)),),
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
                moreProductsDM.length,//length of list
                    (index) =>MoreProductItem(moreProductDM: moreProductsDM[index],),
              ),

            ),
          ),
        ],
      ),
    );
  }

}