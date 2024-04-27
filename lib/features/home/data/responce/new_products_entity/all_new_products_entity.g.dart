// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_new_products_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllNewProductsEntity _$AllNewProductsEntityFromJson(
        Map<String, dynamic> json) =>
    AllNewProductsEntity(
      newProducts: (json['new_products'] as List<dynamic>?)
              ?.map((e) => NewProductEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AllNewProductsEntityToJson(
        AllNewProductsEntity instance) =>
    <String, dynamic>{
      'new_products': instance.newProducts,
    };
