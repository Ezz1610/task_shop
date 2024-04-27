
import 'package:json_annotation/json_annotation.dart';

part 'slider_model.g.dart';

@JsonSerializable()
class SliderDM {
  String ?id;
  @JsonKey(name: "product_id")
  String ?productId;
  String ? image;

  SliderDM({
  this.id,
    this.image,
    this.productId
});


  factory SliderDM.fromJson(Map<String, dynamic> json) => _$SliderDMFromJson(json);

  Map<String, dynamic> toJson() => _$SliderDMToJson(this);
}

