
import 'package:json_annotation/json_annotation.dart';

import 'category_entity.dart';

part 'all_categories_entity.g.dart';

@JsonSerializable()
class AllCategoriesEntity {
  @JsonKey(name: "categories")
  List<CategoryEntity> ?categories;

  AllCategoriesEntity({
  this.categories=const[]
});


  factory AllCategoriesEntity.fromJson(Map<String, dynamic> json) => _$AllCategoriesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AllCategoriesEntityToJson(this);
}

