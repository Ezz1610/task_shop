// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_selected_products_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllSelectedProductsEntity _$AllSelectedProductsEntityFromJson(
        Map<String, dynamic> json) =>
    AllSelectedProductsEntity(
      selectedProducts: (json['selected_products'] as List<dynamic>?)
              ?.map((e) =>
                  SelectedProductEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AllSelectedProductsEntityToJson(
        AllSelectedProductsEntity instance) =>
    <String, dynamic>{
      'selected_products': instance.selectedProducts,
    };
