
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {

  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "msg")
  String? message;
  @JsonKey(name: "data")
  T? data;
  BaseResponse({
    this.message,
    this.status,
    this.data,
  });
  // from json
  factory BaseResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$BaseResponseFromJson(json, fromJsonT);
}
