// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginDataDM _$UserLoginDataDMFromJson(Map<String, dynamic> json) =>
    UserLoginDataDM(
      email: json['email'] as String?,
      name: json['name'] as String?,
      active: json['active'] as String?,
      authKey: json['authKey'] as String?,
      favoriteId: json['favoriteId'] as String?,
      id: json['id'] as String?,
      notifications: json['notifications'] as String?,
      profilePhoto: json['profilePhoto'] as String?,
    );

Map<String, dynamic> _$UserLoginDataDMToJson(UserLoginDataDM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'active': instance.active,
      'name': instance.name,
      'notifications': instance.notifications,
      'profilePhoto': instance.profilePhoto,
      'authKey': instance.authKey,
      'favoriteId': instance.favoriteId,
    };
