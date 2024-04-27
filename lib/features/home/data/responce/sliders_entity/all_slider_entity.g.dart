// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_slider_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllSliderEntity _$AllSliderEntityFromJson(Map<String, dynamic> json) =>
    AllSliderEntity(
      sliders: (json['slider'] as List<dynamic>?)
              ?.map((e) => SliderEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AllSliderEntityToJson(AllSliderEntity instance) =>
    <String, dynamic>{
      'slider': instance.sliders,
    };
