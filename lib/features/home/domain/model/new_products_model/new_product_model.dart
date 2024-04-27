
import 'package:json_annotation/json_annotation.dart';

part 'new_product_model.g.dart';

@JsonSerializable()
class NewProductDM {
  String ?id;
  String ?shortDesc;
  String ?listPrice;
  String ?mainImage;
  String ?salePrice;
  String ?name;
  String ?discount;
  String ?rating;


  NewProductDM({
    this.name,
  this.id,
    this.discount,
    this.listPrice,
    this.mainImage,
    this.rating,
    this.salePrice,
    this.shortDesc

});
  factory NewProductDM.fromJson(Map<String, dynamic> json) => _$NewProductDMFromJson(json);

  Map<String, dynamic> toJson() => _$NewProductDMToJson(this);
}

