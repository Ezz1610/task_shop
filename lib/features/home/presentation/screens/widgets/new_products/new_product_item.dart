import 'package:flutter/material.dart';
import 'package:task/core/app_utils/app_colors.dart';
import 'package:task/core/app_utils/app_extensions.dart';
import 'package:task/core/app_utils/app_text_style.dart';
import 'package:task/core/app_widgets/custom_network_image.dart';
import 'package:task/features/home/domain/model/new_products_model/new_product_model.dart';
import 'package:task/features/home/domain/model/selscted_products_model/selected_product_model.dart';

class NewProductItem extends StatelessWidget{
  const NewProductItem({super.key,required this.newProductDM});
  final NewProductDM newProductDM;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        CustomNetworkImage(

          imageUrl: newProductDM.mainImage!,
          width: 100,
          height:100 ,
        ),
        Text(
            newProductDM.name!,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style:AppTextStyle.getBoldStyle(color: AppColors.black,fontSize: 13)
        ),
        Text(
            newProductDM.shortDesc!,
            textAlign: TextAlign.right,
            maxLines: 3,

            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.getRegularStyle(color: AppColors.grey,fontSize: 11)

        ),
        Row(
          children: [
            Text(
              newProductDM.salePrice!,
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



      ],
    );
  }

}