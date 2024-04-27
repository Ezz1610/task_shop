// ignore_for_file: unused_field

import 'package:dartz/dartz.dart';
import 'package:task/core/app_utils/app_prefs.dart';
import 'package:task/features/auth/domain/model/user_data_login_model.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../../../../core/app_utils/media_query_values.dart';
import '../../../../core/data/network/error_handler.dart';
import '../../../../core/data/network/save_api.dart';
import '../../../../core/data/response/base_response.dart';
import '../data_source/auth_remote_data_source.dart';

import '../request/user_info_request.dart';
import '../responce/user_data_login_entity.dart';
import '../../domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
import '../mappers/user_data_login_mapper.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final SafeApi api;
  final AuthRemoteDataSource remoteDataSource;
  final UserLoginDataMapper _userLoginDataMapper;
  final AppPreferences _appPreferences;

  AuthRepositoryImpl(this.api,
      this._appPreferences,
      this.remoteDataSource,
      this._userLoginDataMapper,
      // this.localDataSourceDataSource,
      // this.appUsersMapper,
      );


  @override
  Future<Either<Failure, UserLoginDataDM?>> getUserDataInfo(
      {required UserLoginDataInfoRequest request}) async {

    dPrint("00000000000000000${remoteDataSource.getUserDataInfo(request: request)}");
    return await api.call(
        apiCall: remoteDataSource.getUserDataInfo(request: request),
        onMap: (BaseResponse<UserLoginDataEntity> response) {
          dPrint("response111111111111");
          /// map data for return model
          var data = _userLoginDataMapper.mapFromEntity(response.data );
          return data;
        });
  }

}
