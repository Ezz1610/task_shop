import 'package:dartz/dartz.dart';
import 'package:task/features/home/data/request/home_data_request.dart';
import 'package:task/features/home/data/request/more_products_data_request.dart';
import 'package:task/features/home/domain/model/home_model/home_model.dart';
import 'package:task/features/home/domain/model/more_products_model/more_product_model.dart';
import 'package:task/features/home/domain/model/more_products_model/more_products_model.dart';
import '../../../../core/data/network/error_handler.dart';
import '../../../../core/domain/usecase/base_usecase.dart';
import '../repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MoreProductsUseCase implements BaseUseCase<MoreProductsDataRequest, List<MoreProductDM>?> {
  final HomeRepository _repository;

  MoreProductsUseCase(this._repository);

  @override
  Future<Either<Failure, List<MoreProductDM>?>> execute(
      MoreProductsDataRequest request) async {
    return await _repository.getMoreProductsData(request: request);
  }
}
