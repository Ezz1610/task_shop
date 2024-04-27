
import 'package:json_annotation/json_annotation.dart';

part 'selected_product_entity.g.dart';

@JsonSerializable()
class SelectedProductEntity {
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


  SelectedProductEntity({
    this.name,
  this.id,
    this.discount,
    this.listPrice,
    this.mainImage,
    this.rating,
    this.salePrice,
    this.shortDesc

});
  factory SelectedProductEntity.fromJson(Map<String, dynamic> json) => _$SelectedProductEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SelectedProductEntityToJson(this);
}

