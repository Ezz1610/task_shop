





import 'package:task/features/home/data/mappers/more_product_mapper/more_product_mapper.dart';
import 'package:task/features/home/data/responce/more_products_entity/more_products_entity.dart';
import 'package:task/features/home/data/responce/sliders_entity/slider_entity.dart';
import 'package:task/features/home/domain/model/sliders_model/slider_model.dart';

import '../../../../../core/app_utils/app_constants.dart';
import '../../../../../core/app_utils/app_extensions.dart';
import '../../../../../core/data/mapper/mapper.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/model/more_products_model/more_products_model.dart';

@injectable
class MoreProductsMapper extends EntityMapper<MoreProductsEntity, MoreProductsDM> {
  final MoreProductMapper _moreProductMapper ;
  MoreProductsMapper(this._moreProductMapper);
  @override
  MoreProductsDM mapFromEntity(MoreProductsEntity? entity) {
    return MoreProductsDM(
      moreProducts:_moreProductMapper.mapFromEntityList(entity?.moreProductsEntity??[]),


    );
  }

  @override
  List<MoreProductsDM> mapFromEntityList(List<MoreProductsEntity> entities) {
    return entities.map((entity) => mapFromEntity(entity)).toList();
  }

  @override
  MoreProductsEntity? mapToEntity(MoreProductsDM domainModel) {
    throw UnimplementedError();
  }
}
