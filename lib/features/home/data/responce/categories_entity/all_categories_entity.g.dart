// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_categories_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCategoriesEntity _$AllCategoriesEntityFromJson(Map<String, dynamic> json) =>
    AllCategoriesEntity(
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => CategoryEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AllCategoriesEntityToJson(
        AllCategoriesEntity instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };
