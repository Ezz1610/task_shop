// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeEntity _$HomeEntityFromJson(Map<String, dynamic> json) => HomeEntity(
      sliders: (json['slider'] as List<dynamic>?)
          ?.map((e) => SliderEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      newProducts: (json['new_products'] as List<dynamic>?)
          ?.map((e) => NewProductEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedProducts: (json['selected_products'] as List<dynamic>?)
          ?.map(
              (e) => SelectedProductEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeEntityToJson(HomeEntity instance) =>
    <String, dynamic>{
      'slider': instance.sliders,
      'products': instance.products,
      'new_products': instance.newProducts,
      'selected_products': instance.selectedProducts,
      'categories': instance.categories,
    };
