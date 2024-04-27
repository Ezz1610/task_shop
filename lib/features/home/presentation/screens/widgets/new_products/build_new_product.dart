import 'package:flutter/material.dart';
import 'package:task/app.dart';
import 'package:task/core/app_utils/media_query_values.dart';
import 'package:task/core/app_widgets/custom_network_image.dart';
import 'package:task/core/components/components.dart';
import 'package:task/features/home/domain/model/home_model/home_model.dart';
import 'package:task/features/home/presentation/screens/widgets/new_products/new_product_item.dart';

import '../products/product_item.dart';

class BuildNewProduct extends StatelessWidget{
  final HomeDM homeDM;
   BuildNewProduct({Key? key, required this.homeDM}):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        myDivider(),
         Padding(
          padding:  const EdgeInsets.all(10.0),
          child: Text(
            App.tr.newProducts,
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
                height:200 ,
                child:ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics:  const BouncingScrollPhysics(),
                    itemBuilder:(context,index) {
                      var model=homeDM.newProducts![index];
                      return NewProductItem(newProductDM: model,);
                    },
                    separatorBuilder: (context,index)=>const SizedBox(
                      width: 10,
                    ),
                    itemCount:homeDM.newProducts!.length),
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