// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_product_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewProductEntity _$NewProductEntityFromJson(Map<String, dynamic> json) =>
    NewProductEntity(
      name: json['name'] as String?,
      id: json['id'] as String?,
      discount: json['discount'] as String?,
      listPrice: json['list_price'] as String?,
      mainImage: json['main_image'] as String?,
      rating: json['rating'] as String?,
      salePrice: json['sale_price'] as String?,
      shortDesc: json['short_desc'] as String?,
    );

Map<String, dynamic> _$NewProductEntityToJson(NewProductEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'short_desc': instance.shortDesc,
      'list_price': instance.listPrice,
      'main_image': instance.mainImage,
      'sale_price': instance.salePrice,
      'name': instance.name,
      'discount': instance.discount,
      'rating': instance.rating,
    };
