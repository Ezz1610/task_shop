
import 'package:json_annotation/json_annotation.dart';

part 'category_entity.g.dart';

@JsonSerializable()
class CategoryEntity {
  String ?id;
  @JsonKey(name: "cat_name")
  String ?categoryName;
  String ? icon;


  CategoryEntity({
  this.id,
    this.categoryName,
    this.icon
});


  factory CategoryEntity.fromJson(Map<String, dynamic> json) => _$CategoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryEntityToJson(this);
}

