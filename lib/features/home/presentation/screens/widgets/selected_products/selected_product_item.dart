import 'package:flutter/material.dart';
import 'package:task/core/app_utils/app_colors.dart';
import 'package:task/core/app_utils/app_extensions.dart';
import 'package:task/core/app_utils/app_text_style.dart';
import 'package:task/core/app_widgets/custom_network_image.dart';
import 'package:task/features/home/domain/model/selscted_products_model/selected_product_model.dart';

class SelectedProductItem extends StatelessWidget{
  const SelectedProductItem({super.key,required this.selectedProductDM});
  final SelectedProductDM selectedProductDM;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        CustomNetworkImage(

          imageUrl: selectedProductDM.mainImage!,
          width: 100,
          height:100 ,
        ),
        Text(
            selectedProductDM.name!,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style:AppTextStyle.getBoldStyle(color: AppColors.black,fontSize: 13)
        ),
        Text(
            selectedProductDM.shortDesc!,
            textAlign: TextAlign.right,
            maxLines: 3,

            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.getRegularStyle(color: AppColors.grey,fontSize: 11)

        ),
        Row(
          children: [
            Text(
              selectedProductDM.salePrice!,
              textDirection: TextDirection.ltr,
              style: AppTextStyle.getBoldStyle(color: AppColors.mainColor,fontSize: 14),

            ),
            Text(
              "درهم اماراتي",
              style: AppTextStyle.getBoldStyle(color: AppColors.mainColor,fontSize: 9),

            ),

          ],
        ),
        const SizedBox(
          width: 5,
        ),
        if(selectedProductDM.discount!="0")
          SizedBox(
            child: Row(
              children: [
                Text(
                  selectedProductDM.listPrice!,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyle.getRegularStyle(
                      color: AppColors.grey,
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough),


                ),
                Text(
                  "درهم اماراتي",
                  style: AppTextStyle.getBoldStyle(color: AppColors.mainColor,fontSize: 9),

                ),
              ],
            ),
          ),
        if(selectedProductDM.discount!="0")
          Container(
            color: AppColors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "خصم",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),


                ),

                Text(
                  "%${ selectedProductDM.discount!}",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),


                ),
              ],
            ),
          ),


      ],
    );
  }

}