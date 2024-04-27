import 'package:task/features/auth/data/responce/user_data_login_entity.dart';
import 'package:task/features/auth/domain/model/user_data_login_model.dart';





import '../../../../core/app_utils/app_constants.dart';
import '../../../../core/app_utils/app_extensions.dart';
import '../../../../core/data/mapper/mapper.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserLoginDataMapper extends EntityMapper<UserLoginDataEntity, UserLoginDataDM> {
  @override
  UserLoginDataDM mapFromEntity(UserLoginDataEntity? entity) {
    return UserLoginDataDM(
      name: entity?.name.orEmpty() ?? AppConstants.empty,
      email: entity?.email.orEmpty() ?? AppConstants.empty,
      active: entity?.active.orEmpty() ?? AppConstants.empty,
      authKey: entity?.authKey.orEmpty() ?? AppConstants.empty,
      favoriteId: entity?.favoriteId.orEmpty() ?? AppConstants.empty,
      id: entity?.id.orEmpty() ?? AppConstants.empty,
      notifications: entity?.notifications.orEmpty() ?? AppConstants.empty,
      profilePhoto: entity?.profilePhoto.orEmpty() ?? AppConstants.empty,
    );
  }

  @override
  List<UserLoginDataDM> mapFromEntityList(List<UserLoginDataEntity> entities) {
    return entities.map((entity) => mapFromEntity(entity)).toList();
  }

  @override
  UserLoginDataEntity? mapToEntity(UserLoginDataDM domainModel) {
    throw UnimplementedError();
  }
}
