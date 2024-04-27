import 'package:flutter/material.dart';
import 'package:task/core/app_utils/app_colors.dart';
import 'package:task/core/app_utils/app_extensions.dart';
import 'package:task/core/app_utils/app_text_style.dart';
import 'package:task/core/app_widgets/custom_network_image.dart';
import 'package:task/features/home/domain/model/categories_model/category_model.dart';
import 'package:task/features/home/domain/model/products_model/product_model.dart';

class CategoryItem extends StatelessWidget{
  const CategoryItem({super.key,required this.categoryDM});
  final CategoryDM categoryDM;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Image(
          image: NetworkImage("${categoryDM.icon}"),
          width: 100,
          height:70 ,
        ),
        Text(
          "${categoryDM.categoryName}",
          textAlign:TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style:TextStyle(color: Colors.black),
        ),
      ],
    );
  }

}