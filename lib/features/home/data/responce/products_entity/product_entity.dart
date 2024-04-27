
import 'package:json_annotation/json_annotation.dart';

part 'product_entity.g.dart';

@JsonSerializable()
class ProductEntity {
  String ?id;
  @JsonKey(name: "short_desc")
  String ?shortDesc;
  @JsonKey(name: "list_price")
  String ?listPrice;
  @JsonKey(name: "main_image")
  String ?mainImage;
  @JsonKey(name: "sale_price")
  String ?salePrice;
  String ?name;
  String ?discount;
  String ?rating;

  ProductEntity({
  this.id,
  this.name,
    this.discount,
    this.listPrice,
    this.mainImage,
    this.rating,
    this.salePrice,
    this.shortDesc

});
  factory ProductEntity.fromJson(Map<String, dynamic> json) => _$ProductEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductEntityToJson(this);
}

