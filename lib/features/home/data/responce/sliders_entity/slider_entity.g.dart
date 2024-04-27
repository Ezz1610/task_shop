// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderEntity _$SliderEntityFromJson(Map<String, dynamic> json) => SliderEntity(
      id: json['id'] as String?,
      image: json['image'] as String?,
      productId: json['product_id'] as String?,
    );

Map<String, dynamic> _$SliderEntityToJson(SliderEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'image': instance.image,
    };
