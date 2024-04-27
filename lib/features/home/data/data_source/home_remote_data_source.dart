import 'package:task/core/app_utils/media_query_values.dart';
import 'package:task/features/home/data/request/more_products_data_request.dart';
import 'package:task/features/home/data/responce/home_entity/home_entity.dart';
import 'package:task/features/home/data/responce/home_entity/home_entity.dart';
import 'package:task/features/home/data/responce/more_products_entity/more_products_entity.dart';
import 'package:task/features/home/data/responce/sliders_entity/all_slider_entity.dart';
import '../../../../core/data/response/base_response.dart';
import '../request/home_data_request.dart';
import 'package:injectable/injectable.dart';
import '../network/home_api.dart';


abstract class HomeRemoteDataSource {

  Future<BaseResponse<HomeEntity>> getHomeData({required HomeDataRequest request});
  Future<BaseResponse<MoreProductsEntity>> getMoreProductsData({required MoreProductsDataRequest request});


}

@Injectable(as: HomeRemoteDataSource)
class RemoteDataSourceImpl implements HomeRemoteDataSource {
  final HomeServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<BaseResponse<HomeEntity>> getHomeData({required HomeDataRequest request}) {


    return _appServiceClient.getHomeData(
      request.authKey,
      request.userId,
    );
  }

  @override
  Future<BaseResponse<MoreProductsEntity>> getMoreProductsData({required MoreProductsDataRequest request}) {
    return _appServiceClient.getMoreProductsData(
      request.authKey,
      request.userId,
      request.searchWith,
      request.homeTypes,
      request.itemCount,
      request.limit,


    );
  }







  }
