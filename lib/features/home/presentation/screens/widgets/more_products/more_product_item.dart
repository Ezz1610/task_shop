import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task/core/app_utils/app_colors.dart';
import 'package:task/core/app_utils/app_extensions.dart';
import 'package:task/core/app_utils/app_text_style.dart';
import 'package:task/core/app_widgets/custom_network_image.dart';
import 'package:task/features/home/domain/model/more_products_model/more_product_model.dart';
import 'package:task/features/home/domain/model/more_products_model/more_products_model.dart';
import 'package:task/features/home/domain/model/products_model/product_model.dart';

class MoreProductItem extends StatelessWidget{
  const MoreProductItem({super.key,required this.moreProductDM});
  final MoreProductDM moreProductDM;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes the position of the shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNetworkImage(
              imageUrl: moreProductDM.mainImage!,
              height:100,
              width: double.infinity
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,

              children: [
                Expanded(
                  flex:2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        moreProductDM.name!,
                        overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style:AppTextStyle.getBoldStyle(color: AppColors.black,fontSize: 13)
                      ),
                      Text(
                        moreProductDM.shortDesc!,
                        textAlign: TextAlign.right,
                          maxLines: 3,
                  
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.getRegularStyle(color: AppColors.grey,fontSize: 11)
                  
                      ),
                    ],),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          moreProductDM.salePrice!,
                          textDirection: TextDirection.ltr,
                          style: AppTextStyle.getBoldStyle(color: AppColors.mainColor,fontSize: 10),
                  
                        ),
                        Text(
                          "درهم اماراتي",
                          style: AppTextStyle.getBoldStyle(color: AppColors.mainColor,fontSize: 10),
                  
                        ),
                  
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if(moreProductDM.discount!="0")
                      SizedBox(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                  
                          children: [
                            Text(
                              moreProductDM.listPrice!,
                              textDirection: TextDirection.rtl,
                              style: AppTextStyle.getRegularStyle(
                                  color: AppColors.grey,
                                  fontSize: 8,
                                  decoration: TextDecoration.lineThrough),
                  
                  
                            ),
                            Text(
                              "درهم اماراتي",
                              style: AppTextStyle.getBoldStyle(color: AppColors.mainColor,fontSize: 9),
                  
                            ),
                          ],
                        ),
                      ),
                    if(moreProductDM.discount!="0")
                      Container(
                        color: AppColors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "خصم",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                  
                  
                            ),
                  
                            Text(
                             "%${ moreProductDM.discount!}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                  
                  
                            ),
                          ],
                        ),
                      ),
                  ],),
                ),



              ],
            ),
          ),
        ],
      ),
    );
  }

}