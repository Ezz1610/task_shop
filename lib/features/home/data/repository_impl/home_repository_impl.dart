// ignore_for_file: unused_field

import 'package:dartz/dartz.dart';
import 'package:task/features/home/data/mappers/home_mapper/home_data_mapper.dart';
import 'package:task/features/home/data/mappers/more_product_mapper/more_product_mapper.dart';
import 'package:task/features/home/data/request/home_data_request.dart';
import 'package:task/features/home/data/request/more_products_data_request.dart';
import 'package:task/features/home/data/responce/home_entity/home_entity.dart';
import 'package:task/features/home/data/responce/more_products_entity/more_product_entity.dart';
import 'package:task/features/home/data/responce/more_products_entity/more_products_entity.dart';
import 'package:task/features/home/domain/model/home_model/home_model.dart';
import 'package:task/features/home/domain/model/more_products_model/more_product_model.dart';
import 'package:task/features/home/domain/model/more_products_model/more_products_model.dart';
import '../../../../core/app_utils/media_query_values.dart';
import '../../../../core/data/network/error_handler.dart';
import '../../../../core/data/network/save_api.dart';
import '../../../../core/data/response/base_response.dart';
import '../data_source/home_remote_data_source.dart';
import '../../domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final SafeApi api;
  final HomeRemoteDataSource remoteDataSource;
  // final HomeLocalDataSource localDataSourceDataSource;
  final HomeMapper _homeMapper;
  final MoreProductMapper _moreProductMapper;

  HomeRepositoryImpl(this.api,
      this.remoteDataSource,
      // this.localDataSourceDataSource,
      this._homeMapper,
      this._moreProductMapper,
      );



  @override
  Future<Either<Failure, HomeDM?>> getHomeData(
      {required HomeDataRequest request})async {
    dPrint("00000000000000000${remoteDataSource.getHomeData(request: request)}");
    return await api.call(
        apiCall: remoteDataSource.getHomeData(request: request),
        onMap: (BaseResponse<HomeEntity> response) {
          dPrint("response111111111111");
          dPrint("response2222222222${response.data!.toJson()}");

          /// map data for return model
          var data = _homeMapper.mapFromEntity(response.data );
          return data;
        });
  }
  @override
  Future<Either<Failure, List<MoreProductDM>?>> getMoreProductsData(
      {required MoreProductsDataRequest request})async {
    dPrint("00000000000000000${remoteDataSource.getMoreProductsData(request: request)}");
    return await api.call(
        apiCall: remoteDataSource.getMoreProductsData(request: request),
        onMap: (BaseResponse<List<MoreProductEntity>> response) {
          dPrint("response111111111111");
          dPrint("response2222222222${response.data!}");

          /// map data for return model
          var data = _moreProductMapper.mapFromEntityList(response.data??[] );
          return data;
        });
  }

}
