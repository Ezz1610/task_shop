import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/app_business_logic/state_renderer/request_builder.dart';
import 'package:task/features/home/domain/model/categories_model/category_model.dart';
import 'package:task/features/home/presentation/cubit/home_cubit.dart';

import '../../../../../../core/components/components.dart';


class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:buildCategory(),
    );
  }
  Widget buildCategory(){
    return RequestBuilder<HomeCubit>(contentBuilder: (context,cubit){
      return ListView.separated(
          physics:const BouncingScrollPhysics(),
          itemBuilder:(context,index)=> buildCatItem(cubit.homeModel!.categories![index]),//data2[index] is: objects
          separatorBuilder:(context,index)=>myDivider(),
          itemCount: cubit.homeModel!.categories!.length);
    },
        retry:  (context,cubit){});
  }
  Widget buildCatItem(CategoryDM categoryDM)=>Row(
    children: [
      Image(
        image: NetworkImage(categoryDM.icon!),
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      SizedBox(
        width: 20,
      ),
      Spacer(),

      Text(categoryDM.categoryName!),
      Icon(
          Icons.arrow_forward_ios
      ),

    ],
  );
}
