import 'package:dartz/dartz.dart';

import 'package:task/features/auth/domain/model/user_data_login_model.dart';
import '../../../../core/data/network/error_handler.dart';

import '../../data/request/user_info_request.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserLoginDataDM?>> getUserDataInfo({required UserLoginDataInfoRequest request});
}
