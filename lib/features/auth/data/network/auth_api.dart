import 'package:dio/dio.dart';
import '../../../../core/app_utils/api_urls.dart';
import '../../../../core/data/response/base_response.dart';
import '../responce/user_data_login_entity.dart';
import 'package:retrofit/http.dart';
import '../request/user_info_request.dart';


part 'auth_api.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
abstract class AuthServiceClient {
  factory AuthServiceClient(Dio dio, {String baseUrl}) = _AuthServiceClient;


  @FormUrlEncoded()
  @POST(ApiUrls.getUserInfo)
  Future<BaseResponse<UserLoginDataEntity>> getUserDataInfo(
      @Field("email") String email,
      @Field("password") String password,
      @Field("token") String token,
      @Field("platform") String platform,
      @Field("device_id") String deviceId
  );


}
