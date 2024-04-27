// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_products_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllProductsEntity _$AllProductsEntityFromJson(Map<String, dynamic> json) =>
    AllProductsEntity(
      products: (json['home'] as List<dynamic>?)
              ?.map((e) => ProductEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AllProductsEntityToJson(AllProductsEntity instance) =>
    <String, dynamic>{
      'home': instance.products,
    };
