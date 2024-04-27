import 'package:flutter/material.dart';
import 'package:task/app.dart';
import 'package:task/core/app_utils/media_query_values.dart';
import 'package:task/features/home/domain/model/home_model/home_model.dart';
import 'package:task/features/home/presentation/screens/widgets/categories/category_item.dart';


class BuildCategoryProduct extends StatelessWidget{
  final HomeDM homeDM;
   BuildCategoryProduct({Key? key, required this.homeDM}):super(key: key);

  @override
  Widget build(BuildContext context) {
    dPrint("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${homeDM.products!.length}");
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child:  Text(
            App.tr.categories,
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
                height:100 ,
                child:ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics:  const BouncingScrollPhysics(),
                    itemBuilder:(context,index)=>CategoryItem(categoryDM: homeDM.categories![index],),
                    separatorBuilder: (context,index)=>const SizedBox(
                      width: 10,
                    ),
                    itemCount:homeDM.categories!.length),
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