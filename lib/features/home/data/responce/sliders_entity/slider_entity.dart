
import 'package:json_annotation/json_annotation.dart';

part 'slider_entity.g.dart';

@JsonSerializable()
class SliderEntity {
  String ?id;
  @JsonKey(name: "product_id")
  String ?productId;
  String ? image;

  SliderEntity({
  this.id,
    this.image,
    this.productId
});


  factory SliderEntity.fromJson(Map<String, dynamic> json) => _$SliderEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SliderEntityToJson(this);
}

