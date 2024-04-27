





import 'package:task/features/home/data/responce/new_products_entity/new_product_entity.dart';
import 'package:task/features/home/domain/model/new_products_model/new_product_model.dart';
import '../../../../../core/app_utils/app_constants.dart';
import '../../../../../core/app_utils/app_extensions.dart';
import '../../../../../core/data/mapper/mapper.dart';
import 'package:injectable/injectable.dart';

@injectable
class NewProductMapper extends EntityMapper<NewProductEntity, NewProductDM> {
  @override
  NewProductDM mapFromEntity(NewProductEntity? entity) {
    return NewProductDM(
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
  List<NewProductDM> mapFromEntityList(List<NewProductEntity> entities) {
    return entities.map((entity) => mapFromEntity(entity)).toList();
  }

  @override
  NewProductEntity? mapToEntity(NewProductDM domainModel) {
    throw UnimplementedError();
  }
}
