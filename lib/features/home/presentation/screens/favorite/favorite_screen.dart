import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/app_business_logic/state_renderer/request_builder.dart';
import 'package:task/core/app_widgets/custom_network_image.dart';
import 'package:task/core/components/components.dart';
import 'package:task/features/home/domain/model/categories_model/category_model.dart';
import 'package:task/features/home/domain/model/selscted_products_model/selected_product_model.dart';
import 'package:task/features/home/presentation/cubit/home_cubit.dart';



class FavoritScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Container(child: Text("FavoritScreen"),),
    );
  }

}
