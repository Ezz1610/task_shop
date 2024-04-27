
import 'package:json_annotation/json_annotation.dart';

part 'selected_product_model.g.dart';

@JsonSerializable()
class SelectedProductDM {
  String ?id;
  String ?shortDesc;
  String ?listPrice;
  String ?mainImage;
  String ?salePrice;
  String ?name;
  String ?discount;
  String ?rating;


  SelectedProductDM({
    this.name,
  this.id,
    this.discount,
    this.listPrice,
    this.mainImage,
    this.rating,
    this.salePrice,
    this.shortDesc

});
  factory SelectedProductDM.fromJson(Map<String, dynamic> json) => _$SelectedProductDMFromJson(json);

  Map<String, dynamic> toJson() => _$SelectedProductDMToJson(this);
}

