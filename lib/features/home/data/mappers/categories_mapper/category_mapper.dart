





import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:task/features/home/data/responce/categories_entity/category_entity.dart';
import 'package:task/features/home/data/responce/products_entity/product_entity.dart';
import 'package:task/features/home/data/responce/sliders_entity/slider_entity.dart';
import 'package:task/features/home/domain/model/categories_model/category_model.dart';
import 'package:task/features/home/domain/model/products_model/product_model.dart';
import 'package:task/features/home/domain/model/sliders_model/slider_model.dart';

import '../../../../../core/app_utils/app_constants.dart';
import '../../../../../core/app_utils/app_extensions.dart';
import '../../../../../core/data/mapper/mapper.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryMapper extends EntityMapper<CategoryEntity, CategoryDM> {
  @override
  CategoryDM mapFromEntity(CategoryEntity? entity) {
    return CategoryDM(
      id: entity?.id.orEmpty() ?? AppConstants.empty,
      categoryName: entity?.categoryName.orEmpty() ?? AppConstants.empty,
      icon: entity?.icon.orEmpty() ?? AppConstants.empty,




    );
  }

  @override
  List<CategoryDM> mapFromEntityList(List<CategoryEntity> entities) {
    return entities.map((entity) => mapFromEntity(entity)).toList();
  }

  @override
  CategoryEntity? mapToEntity(CategoryDM domainModel) {
    throw UnimplementedError();
  }
}
