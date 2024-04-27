import 'package:dartz/dartz.dart';
import 'package:task/features/home/data/request/home_data_request.dart';
import 'package:task/features/home/domain/model/home_model/home_model.dart';
import '../../../../core/data/network/error_handler.dart';
import '../../../../core/domain/usecase/base_usecase.dart';
import '../repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeUseCase implements BaseUseCase<HomeDataRequest, HomeDM?> {
  final HomeRepository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, HomeDM?>> execute(
      HomeDataRequest request) async {
    return await _repository.getHomeData(request: request);
  }
}
