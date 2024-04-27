





import 'package:task/features/home/data/responce/products_entity/product_entity.dart';
import 'package:task/features/home/data/responce/sliders_entity/slider_entity.dart';
import 'package:task/features/home/domain/model/products_model/product_model.dart';
import 'package:task/features/home/domain/model/sliders_model/slider_model.dart';

import '../../../../../core/app_utils/app_constants.dart';
import '../../../../../core/app_utils/app_extensions.dart';
import '../../../../../core/data/mapper/mapper.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductMapper extends EntityMapper<ProductEntity, ProductDM> {
  @override
  ProductDM mapFromEntity(ProductEntity? entity) {
    return ProductDM(
      id: entity?.id.orEmpty() ?? AppConstants.empty,
      name: entity?.name.orEmpty() ?? AppConstants.empty,
      discount: entity?.discount.orEmpty() ?? AppConstants.empty,
      listPrice: entity?.listPrice.orEmpty() ?? AppConstants.empty,
      mainImage: entity?.mainImage.orEmpty() ?? AppConstants.empty,
      rating: entity?.rating.orEmpty() ?? AppConstants.empty,
      salePrice: entity?.salePrice.orEmpty() ?? AppConstants.empty,
      shortDesc: entity?.shortDesc.orEmpty() ?? AppConstants.empty,



    );
  }

  @override
  List<ProductDM> mapFromEntityList(List<ProductEntity> entities) {
    return entities.map((entity) => mapFromEntity(entity)).toList();
  }

  @override
  ProductEntity? mapToEntity(ProductDM domainModel) {
    throw UnimplementedError();
  }
}
