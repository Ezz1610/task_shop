import 'package:flutter/material.dart';
import 'package:task/app.dart';
import 'package:task/core/app_utils/app_colors.dart';
import 'package:task/core/app_utils/media_query_values.dart';
import 'package:task/core/components/components.dart';
import 'package:task/features/home/domain/model/home_model/home_model.dart';
import 'package:task/features/home/domain/model/more_products_model/more_products_model.dart';

import 'more_product_item.dart';

class BuildGridMoreProducts extends StatelessWidget{
  final MoreProductsDM moreProductsDM;
   BuildGridMoreProducts({Key? key, required this.moreProductsDM}):super(key: key);

  @override
  Widget build(BuildContext context) {
    dPrint("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${moreProductsDM.moreProducts!.length}");
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
              moreProductsDM.moreProducts!.length,//length of list
                  (index) =>MoreProductItem(moreProductDM: moreProductsDM.moreProducts![index],),
            ),

          ),
        ),
      ],
    );
  }

}