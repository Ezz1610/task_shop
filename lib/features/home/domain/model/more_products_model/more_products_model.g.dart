// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'more_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoreProductsDM _$MoreProductsDMFromJson(Map<String, dynamic> json) =>
    MoreProductsDM(
      moreProducts: (json['moreProducts'] as List<dynamic>?)
          ?.map((e) => MoreProductDM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoreProductsDMToJson(MoreProductsDM instance) =>
    <String, dynamic>{
      'moreProducts': instance.moreProducts,
    };
