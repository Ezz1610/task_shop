





import 'package:task/features/home/data/responce/sliders_entity/slider_entity.dart';
import 'package:task/features/home/domain/model/sliders_model/slider_model.dart';

import '../../../../../core/app_utils/app_constants.dart';
import '../../../../../core/app_utils/app_extensions.dart';
import '../../../../../core/data/mapper/mapper.dart';
import 'package:injectable/injectable.dart';

@injectable
class SliderMapper extends EntityMapper<SliderEntity, SliderDM> {
  @override
  SliderDM mapFromEntity(SliderEntity? entity) {
    return SliderDM(
      id: entity?.id.orEmpty() ?? AppConstants.empty,
      image: entity?.image.orEmpty() ?? AppConstants.empty,
      productId: entity?.productId.orEmpty() ?? AppConstants.empty,


    );
  }

  @override
  List<SliderDM> mapFromEntityList(List<SliderEntity> entities) {
    return entities.map((entity) => mapFromEntity(entity)).toList();
  }

  @override
  SliderEntity? mapToEntity(SliderDM domainModel) {
    throw UnimplementedError();
  }
}
