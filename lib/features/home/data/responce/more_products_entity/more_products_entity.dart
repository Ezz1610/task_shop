
import 'package:json_annotation/json_annotation.dart';
import 'package:task/features/home/data/responce/categories_entity/all_categories_entity.dart';
import 'package:task/features/home/data/responce/categories_entity/category_entity.dart';
import 'package:task/features/home/data/responce/more_products_entity/more_product_entity.dart';
import 'package:task/features/home/data/responce/new_products_entity/all_new_products_entity.dart';
import 'package:task/features/home/data/responce/new_products_entity/new_product_entity.dart';
import 'package:task/features/home/data/responce/products_entity/all_products_entity.dart';
import 'package:task/features/home/data/responce/products_entity/product_entity.dart';
import 'package:task/features/home/data/responce/selscted_products_entity/all_selected_products_entity.dart';
import 'package:task/features/home/data/responce/selscted_products_entity/selected_product_entity.dart';
import 'package:task/features/home/data/responce/sliders_entity/all_slider_entity.dart';
import 'package:task/features/home/data/responce/sliders_entity/slider_entity.dart';


part 'more_products_entity.g.dart';

@JsonSerializable()
class MoreProductsEntity {

  @JsonKey(name: "data")
  List<MoreProductEntity> ? moreProductsEntity;

  MoreProductsEntity({
    this.moreProductsEntity,




});


  factory MoreProductsEntity.fromJson(Map<String, dynamic> json) => _$MoreProductsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MoreProductsEntityToJson(this);
}

