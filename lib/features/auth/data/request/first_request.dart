import 'package:json_annotation/json_annotation.dart';

part 'first_request.g.dart';

@JsonSerializable()
class FirstRequest {
  final String email;
  final String password;




  FirstRequest({
    required this.email,
    required this.password,


  });

  factory FirstRequest.fromJson(Map<String, dynamic> json) =>
      _$FirstRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FirstRequestToJson(this);
}
