
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductDM {
  String ?id;
  String ?shortDesc;
  String ?listPrice;
  String ?mainImage;
  String ?salePrice;
  String ?name;
  String ?discount;
  String ?rating;


  ProductDM({
  this.id,
  this.name,
    this.discount,
    this.listPrice,
    this.mainImage,
    this.rating,
    this.salePrice,
    this.shortDesc

});
  factory ProductDM.fromJson(Map<String, dynamic> json) => _$ProductDMFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDMToJson(this);
}

