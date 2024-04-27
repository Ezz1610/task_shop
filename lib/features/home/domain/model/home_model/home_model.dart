
import 'package:json_annotation/json_annotation.dart';
import 'package:task/features/home/data/responce/categories_entity/all_categories_entity.dart';
import 'package:task/features/home/data/responce/categories_entity/category_entity.dart';
import 'package:task/features/home/data/responce/new_products_entity/all_new_products_entity.dart';
import 'package:task/features/home/data/responce/new_products_entity/new_product_entity.dart';
import 'package:task/features/home/data/responce/products_entity/all_products_entity.dart';
import 'package:task/features/home/data/responce/products_entity/product_entity.dart';
import 'package:task/features/home/data/responce/selscted_products_entity/all_selected_products_entity.dart';
import 'package:task/features/home/data/responce/selscted_products_entity/selected_product_entity.dart';
import 'package:task/features/home/data/responce/sliders_entity/all_slider_entity.dart';
import 'package:task/features/home/data/responce/sliders_entity/slider_entity.dart';
import 'package:task/features/home/domain/model/categories_model/category_model.dart';
import 'package:task/features/home/domain/model/new_products_model/new_product_model.dart';
import 'package:task/features/home/domain/model/products_model/product_model.dart';
import 'package:task/features/home/domain/model/selscted_products_model/selected_product_model.dart';
import 'package:task/features/home/domain/model/sliders_model/slider_model.dart';


part 'home_model.g.dart';

@JsonSerializable()
class HomeDM {
  List<SliderDM> ?sliders;

  List<ProductDM> ?products;

  List<NewProductDM> ?newProducts;

  List<SelectedProductDM> ?selectedProducts;

  List<CategoryDM> ?categories;
  HomeDM({
    this.sliders,
    this.products,
    this.newProducts,
    this.selectedProducts,
    this.categories



  });


  factory HomeDM.fromJson(Map<String, dynamic> json) => _$HomeDMFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDMToJson(this);
}

