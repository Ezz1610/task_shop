// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDM _$HomeDMFromJson(Map<String, dynamic> json) => HomeDM(
      sliders: (json['sliders'] as List<dynamic>?)
          ?.map((e) => SliderDM.fromJson(e as Map<String, dynamic>))
          .toList(),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductDM.fromJson(e as Map<String, dynamic>))
          .toList(),
      newProducts: (json['newProducts'] as List<dynamic>?)
          ?.map((e) => NewProductDM.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedProducts: (json['selectedProducts'] as List<dynamic>?)
          ?.map((e) => SelectedProductDM.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryDM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDMToJson(HomeDM instance) => <String, dynamic>{
      'sliders': instance.sliders,
      'products': instance.products,
      'newProducts': instance.newProducts,
      'selectedProducts': instance.selectedProducts,
      'categories': instance.categories,
    };
