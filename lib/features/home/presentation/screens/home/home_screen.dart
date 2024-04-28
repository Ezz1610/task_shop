

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';
import 'package:task/core/app_business_logic/state_renderer/request_builder.dart';
import 'package:task/core/app_utils/app_assets.dart';
import 'package:task/core/app_utils/app_colors.dart';
import 'package:task/core/app_utils/media_query_values.dart';
import 'package:task/core/app_widgets/custom_network_image.dart';
import 'package:task/features/home/domain/model/home_model/home_model.dart';
import 'package:task/features/home/domain/model/products_model/product_model.dart';
import 'package:task/features/home/presentation/cubit/home_cubit.dart';
import 'package:task/features/home/presentation/screens/widgets/categories/build_category_product.dart';
import 'package:task/features/home/presentation/screens/widgets/products/build_grid_product.dart';
import 'package:task/features/home/presentation/screens/widgets/new_products/build_new_product.dart';
import 'package:task/features/home/presentation/screens/widgets/selected_products/build_selected_product.dart';
import 'package:task/features/home/presentation/screens/widgets/slider/slider_widget.dart';
import 'package:task/features/home/presentation/screens/widgets/test.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen();


  @override
  Widget build(BuildContext context) {
    return _apiRequestHome();
  }
  Widget  _apiRequestHome()=>RequestBuilder<HomeCubit>(
      contentBuilder: (context,cubit){
        dPrint("products!.length is : ${cubit.homeModel!.products!.length}");
        dPrint("selectedProducts!.length is : ${cubit.homeModel!.selectedProducts!.length}");
        dPrint("sliders!.length is : ${cubit.homeModel!.sliders!.length}");
        return SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0, right: 4.0),
                              child: Icon(Icons.search),
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Image(
                          width: 30,
                          height: 30,
                          image: AssetImage(AppImageAssets.shar)),
                    ),                ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SliderWidget(homeDM: cubit.homeModel!,),
            ),
            BuildCategoryProduct(homeDM: cubit.homeModel!,),
            BuildGridProduct(homeDM: cubit.homeModel!,),
            BuildSelectedProduct(homeDM: cubit.homeModel!,),
            BuildNewProduct(homeDM: cubit.homeModel!,),

          ],),
        );
      },
      retry: (context,cubit){});



}

