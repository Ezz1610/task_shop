
import 'package:json_annotation/json_annotation.dart';

import 'new_product_entity.dart';

part 'all_new_products_entity.g.dart';

@JsonSerializable()
class AllNewProductsEntity {
  @JsonKey(name: "new_products")
  List<NewProductEntity> ?newProducts;

  AllNewProductsEntity({
  this.newProducts=const[]
});


  factory AllNewProductsEntity.fromJson(Map<String, dynamic> json) => _$AllNewProductsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AllNewProductsEntityToJson(this);
}

