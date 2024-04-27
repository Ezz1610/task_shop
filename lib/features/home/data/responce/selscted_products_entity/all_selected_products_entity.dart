
import 'package:json_annotation/json_annotation.dart';

import 'selected_product_entity.dart';

part 'all_selected_products_entity.g.dart';

@JsonSerializable()
class AllSelectedProductsEntity {
  @JsonKey(name: "selected_products")
  List<SelectedProductEntity> ?selectedProducts;

  AllSelectedProductsEntity({
  this.selectedProducts=const[]
});


  factory AllSelectedProductsEntity.fromJson(Map<String, dynamic> json) => _$AllSelectedProductsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AllSelectedProductsEntityToJson(this);
}

