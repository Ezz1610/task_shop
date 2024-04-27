import 'package:flutter/material.dart';
import 'package:task/app.dart';
import 'package:task/core/app_utils/app_colors.dart';
import 'package:task/core/app_utils/app_text_style.dart';
import 'package:task/core/app_utils/media_query_values.dart';
import 'package:task/core/app_widgets/custom_network_image.dart';
import 'package:task/core/components/components.dart';
import 'package:task/features/home/domain/model/home_model/home_model.dart';

import '../products/product_item.dart';
import 'selected_product_item.dart';

class BuildSelectedProduct extends StatelessWidget{
  final HomeDM homeDM;
   BuildSelectedProduct({Key? key, required this.homeDM}):super(key: key);

  @override
  Widget build(BuildContext context) {
    dPrint("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${homeDM.products!.length}");
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        myDivider(),
         Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            App.tr.selectedProducts,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        ),


        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child:ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics:  const BouncingScrollPhysics(),
                    itemBuilder:(context,index) {
                      var model=homeDM.selectedProducts![index];
                      return SelectedProductItem(selectedProductDM: model,);
                    },
                    separatorBuilder: (context,index)=>const SizedBox(
                      width: 10,
                    ),
                    itemCount:homeDM.selectedProducts!.length),
              ),
              const SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],);
  }

}