
import 'package:json_annotation/json_annotation.dart';

part 'new_product_entity.g.dart';

@JsonSerializable()
class NewProductEntity {
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


  NewProductEntity({
    this.name,
  this.id,
    this.discount,
    this.listPrice,
    this.mainImage,
    this.rating,
    this.salePrice,
    this.shortDesc

});
  factory NewProductEntity.fromJson(Map<String, dynamic> json) => _$NewProductEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NewProductEntityToJson(this);
}

