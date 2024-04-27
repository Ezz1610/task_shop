
import 'package:json_annotation/json_annotation.dart';

part 'more_product_entity.g.dart';

@JsonSerializable()
class MoreProductEntity {
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

  MoreProductEntity({
  this.id,
  this.name,
    this.discount,
    this.listPrice,
    this.mainImage,
    this.rating,
    this.salePrice,
    this.shortDesc

});
  factory MoreProductEntity.fromJson(Map<String, dynamic> json) => _$MoreProductEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MoreProductEntityToJson(this);
}

