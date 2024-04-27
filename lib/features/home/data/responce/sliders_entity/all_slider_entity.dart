
import 'package:json_annotation/json_annotation.dart';

import 'slider_entity.dart';

part 'all_slider_entity.g.dart';

@JsonSerializable()
class AllSliderEntity {
  @JsonKey(name: "slider")
  List<SliderEntity> ?sliders;

  AllSliderEntity({
  this.sliders=const[]
});


  factory AllSliderEntity.fromJson(Map<String, dynamic> json) => _$AllSliderEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AllSliderEntityToJson(this);
}

