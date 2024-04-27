
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


part 'home_entity.g.dart';

@JsonSerializable()
class HomeEntity {
  @JsonKey(name: "slider")
  List<SliderEntity> ?sliders;

  @JsonKey(name: "products")
  List<ProductEntity> ?products;

  @JsonKey(name: "new_products")
  List<NewProductEntity> ?newProducts;

  @JsonKey(name: "selected_products")
  List<SelectedProductEntity> ?selectedProducts;

  @JsonKey(name: "categories")
  List<CategoryEntity> ?categories;
  HomeEntity({
    this.sliders,
    this.products,
    this.newProducts,
    this.selectedProducts,
    this.categories



});


  factory HomeEntity.fromJson(Map<String, dynamic> json) => _$HomeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HomeEntityToJson(this);
}

