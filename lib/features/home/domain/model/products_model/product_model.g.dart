// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDM _$ProductDMFromJson(Map<String, dynamic> json) => ProductDM(
      id: json['id'] as String?,
      name: json['name'] as String?,
      discount: json['discount'] as String?,
      listPrice: json['listPrice'] as String?,
      mainImage: json['mainImage'] as String?,
      rating: json['rating'] as String?,
      salePrice: json['salePrice'] as String?,
      shortDesc: json['shortDesc'] as String?,
    );

Map<String, dynamic> _$ProductDMToJson(ProductDM instance) => <String, dynamic>{
      'id': instance.id,
      'shortDesc': instance.shortDesc,
      'listPrice': instance.listPrice,
      'mainImage': instance.mainImage,
      'salePrice': instance.salePrice,
      'name': instance.name,
      'discount': instance.discount,
      'rating': instance.rating,
    };
