import 'package:dio/dio.dart';
import 'package:task/core/app_widgets/language_direction.dart';
import 'package:task/core/data/response/base_response.dart';
import 'package:task/core/dependency_injection/module/dio_module.dart';
import 'package:task/features/auth/data/responce/user_data_login_entity.dart';
import 'package:task/features/home/data/request/home_data_request.dart';
import 'package:task/features/home/data/responce/home_entity/home_entity.dart';
import 'package:task/features/home/data/responce/more_products_entity/more_products_entity.dart';
import 'package:task/features/home/data/responce/sliders_entity/all_slider_entity.dart';
import '../../../../core/app_utils/api_urls.dart';
import 'package:retrofit/http.dart';


part 'home_api.g.dart';
@RestApi(baseUrl: ApiUrls.baseUrl)
abstract class HomeServiceClient {
  factory HomeServiceClient(Dio dio, {String baseUrl}) = _HomeServiceClient;

  @FormUrlEncoded()
  @POST(ApiUrls.getHomeData)
  Future<BaseResponse<HomeEntity>> getHomeData(
      @Field("auth_key") String authKey,
      @Field("user_id") String userId,
      );

  @FormUrlEncoded()
  @POST(ApiUrls.getMoreProducts)
  Future<BaseResponse<MoreProductsEntity>> getMoreProductsData(
      @Field("auth_key") String authKey,
      @Field("user_id") String userId,
      @Field("search_with") String searchWith,
      @Field("home_types") String homeTypes,
      @Field("item_count") String itemCount,
      @Field("limit") String limit,

      );





}
