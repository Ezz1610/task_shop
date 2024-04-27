
import 'package:json_annotation/json_annotation.dart';

part 'user_data_login_entity.g.dart';

@JsonSerializable()
class UserLoginDataEntity {
  String ?id;
  String ?email;
  String ? active;
  String ? name;
  String ? notifications;
  @JsonKey(name: "profile_photo")
  String ? profilePhoto;
  @JsonKey(name: "auth_key")
  String ? authKey;
  @JsonKey(name: "Favorite_id")
  String ? favoriteId;
  UserLoginDataEntity({
    this.email,
    this.name,
    this.active,
    this.authKey,
    this.favoriteId,
    this.id,
    this.notifications,
    this.profilePhoto
});


  factory UserLoginDataEntity.fromJson(Map<String, dynamic> json) => _$UserLoginDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginDataEntityToJson(this);
}

