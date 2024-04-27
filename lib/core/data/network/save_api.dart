import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:task/core/app_utils/media_query_values.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/data/response/base_response.dart';
import '/../core/data/network/error_handler.dart';
import '/../core/data/network/network_info.dart';

@injectable
class SafeApi {
  final NetworkInfo _networkInfo;

  SafeApi(this._networkInfo);

  Future<Either<Failure, T>> call<T, M>(
      {required Future<dynamic> apiCall,
      VoidCallback? clearCash,
        T Function(BaseResponse<M>)? onMap}) async {
    dPrint("response isssssssssss111111$apiCall");
    dPrint("response isssssssssss${onMap.toString()}");

    if (await _networkInfo.isConnected) {
      try {
        // its safe to call API
        final response = await apiCall;
        dPrint("response isssssssssss22222222222${response.status}");

        if (response.status) {
          // success
          // return right
          if (onMap != null) {
            // return Right(mapper.mapFromEntity(response.data));

            return Right(onMap.call(response));
          }
          else if (response.data != null) {
            // if (clearCash != null) clearCash.call();
            return Right(response.message);

          }
          else {
            return Right(response.status);
          }
        }else {
          // failure
          // return left
          dPrint("noNulllllllllllllll6");

          return Left(Failure(response.hashCode,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error, s) {
        dPrint("noNulllllllllllllll7");

        if (kDebugMode) {
          print("SafeApi Error: $error");
        }
        if (kDebugMode) {
          print("SafeApi Error is: $s");
        }
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return network connection error
      // return left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
