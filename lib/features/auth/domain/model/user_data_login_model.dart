
import 'package:json_annotation/json_annotation.dart';

//بايدي
part 'user_data_login_model.g.dart';

@JsonSerializable()
class UserLoginDataDM {
  String ?id;
  String ?email;
  String ? active;
  String ? name;
  String ? notifications;
  String ? profilePhoto;
  String ? authKey;
  String ? favoriteId;
  UserLoginDataDM({
    this.email,
    this.name,
    this.active,
    this.authKey,
    this.favoriteId,
    this.id,
    this.notifications,
    this.profilePhoto
  });

  factory UserLoginDataDM.fromJson(Map<String, dynamic> json) => _$UserLoginDataDMFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginDataDMToJson(this);
}

