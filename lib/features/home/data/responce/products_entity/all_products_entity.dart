
import 'package:json_annotation/json_annotation.dart';

import 'product_entity.dart';

part 'all_products_entity.g.dart';

@JsonSerializable()
class AllProductsEntity {
  @JsonKey(name: "home")
  List<ProductEntity> ?products;

  AllProductsEntity({
  this.products=const[]
});


  factory AllProductsEntity.fromJson(Map<String, dynamic> json) => _$AllProductsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AllProductsEntityToJson(this);
}

