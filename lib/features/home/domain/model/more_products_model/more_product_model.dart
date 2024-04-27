
import 'package:json_annotation/json_annotation.dart';

part 'more_product_model.g.dart';

@JsonSerializable()
class MoreProductDM {
  String ?id;
  String ?shortDesc;
  String ?listPrice;
  String ?mainImage;
  String ?salePrice;
  String ?name;
  String ?discount;
  String ?rating;

  MoreProductDM({
  this.id,
  this.name,
    this.discount,
    this.listPrice,
    this.mainImage,
    this.rating,
    this.salePrice,
    this.shortDesc

});
  factory MoreProductDM.fromJson(Map<String, dynamic> json) => _$MoreProductDMFromJson(json);

  Map<String, dynamic> toJson() => _$MoreProductDMToJson(this);
}

