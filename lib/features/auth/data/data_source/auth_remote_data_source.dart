import 'package:task/core/app_utils/media_query_values.dart';
import '../../../../core/data/response/base_response.dart';
import '../responce/user_data_login_entity.dart';
import 'package:injectable/injectable.dart';
import '../network/auth_api.dart';
import '../request/user_info_request.dart';

abstract class AuthRemoteDataSource {

  Future<BaseResponse<UserLoginDataEntity>> getUserDataInfo({required UserLoginDataInfoRequest request});


}

@Injectable(as: AuthRemoteDataSource)
class RemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);


  @override
  Future<BaseResponse<UserLoginDataEntity>> getUserDataInfo({required UserLoginDataInfoRequest request}) async {

    return _appServiceClient.getUserDataInfo(
        request.email,
        request.password,
        request.token,
        request.platform,
        request.deviceId
    );
  }



}
