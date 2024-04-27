// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_login_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginDataEntity _$UserLoginDataEntityFromJson(Map<String, dynamic> json) =>
    UserLoginDataEntity(
      email: json['email'] as String?,
      name: json['name'] as String?,
      active: json['active'] as String?,
      authKey: json['auth_key'] as String?,
      favoriteId: json['Favorite_id'] as String?,
      id: json['id'] as String?,
      notifications: json['notifications'] as String?,
      profilePhoto: json['profile_photo'] as String?,
    );

Map<String, dynamic> _$UserLoginDataEntityToJson(
        UserLoginDataEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'active': instance.active,
      'name': instance.name,
      'notifications': instance.notifications,
      'profile_photo': instance.profilePhoto,
      'auth_key': instance.authKey,
      'Favorite_id': instance.favoriteId,
    };
