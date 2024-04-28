import 'package:dartz/dartz.dart';
import 'package:task/features/home/data/request/more_products_data_request.dart';
import 'package:task/features/home/domain/model/home_model/home_model.dart';
import 'package:task/features/home/domain/model/more_products_model/more_product_model.dart';
import 'package:task/features/home/domain/model/more_products_model/more_products_model.dart';
import '../../../../core/data/network/error_handler.dart';
import '../../data/request/home_data_request.dart';


abstract class HomeRepository {
  Future<Either<Failure, HomeDM?>> getHomeData({required HomeDataRequest request});
  Future<Either<Failure, List<MoreProductDM>?>> getMoreProductsData({required MoreProductsDataRequest request});
}
