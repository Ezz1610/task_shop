// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'more_products_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoreProductsEntity _$MoreProductsEntityFromJson(Map<String, dynamic> json) =>
    MoreProductsEntity(
      moreProductsEntity: (json['data'] as List<dynamic>?)
          ?.map((e) => MoreProductEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoreProductsEntityToJson(MoreProductsEntity instance) =>
    <String, dynamic>{
      'data': instance.moreProductsEntity,
    };
