import 'package:dartz/dartz.dart';
import 'package:task/features/auth/domain/model/user_data_login_model.dart';
import '../../../../core/data/network/error_handler.dart';
import '../../../../core/domain/usecase/base_usecase.dart';
import '../../data/request/user_info_request.dart';
import '../repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserLogInUseCase
    implements BaseUseCase<UserLoginDataInfoRequest, UserLoginDataDM?> {
  final AuthRepository _repository;

  UserLogInUseCase(this._repository);

  @override
  Future<Either<Failure, UserLoginDataDM?>> execute(
      UserLoginDataInfoRequest request) async {
    return await _repository.getUserDataInfo(request: request);
  }
}
