import 'package:dio/dio.dart';
import 'package:task/features/auth/domain/model/user_data_login_model.dart';
import 'package:task/features/home/data/network/home_api.dart';
import '../../../features/auth/data/network/auth_api.dart';

import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DIModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  InternetConnectionChecker get connectionChecker => InternetConnectionChecker();
  AuthServiceClient getServiceClient(Dio client) => AuthServiceClient(client);
  HomeServiceClient getHomeServiceClient(Dio client) => HomeServiceClient(client);
  UserLoginDataDM getUserLoginDataDM() => UserLoginDataDM();
}
