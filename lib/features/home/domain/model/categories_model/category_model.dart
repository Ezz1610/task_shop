
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryDM {
  String ?id;
  String ?categoryName;
  String ? icon;


  CategoryDM({
  this.id,
    this.categoryName,
    this.icon
});


  factory CategoryDM.fromJson(Map<String, dynamic> json) => _$CategoryDMFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDMToJson(this);
}

