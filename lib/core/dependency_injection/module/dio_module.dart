// ignore_for_file: constant_identifier_names


import 'package:dio/dio.dart';
import 'package:task/core/app_utils/media_query_values.dart';
import '../../app_utils/api_urls.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/app_utils/app_prefs.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String ACCEPT_Language = "Accept-Language";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";
 String LANGUAGE = "ar";

@module
abstract class DioModule {
  @preResolve
  @factoryMethod
  Future<Dio> getDio(AppPreferences _appPreferences) async {
    Dio dio = Dio();

    String language =  _appPreferences.appLanguage;

    dio.updateHeader(language);

    if (!kReleaseMode) {
      // its debug mode so print app logs
      dio.interceptors.add(LogInterceptor(
          requestBody: true,
          responseBody: true,
          request: true,
          requestHeader: true,
          responseHeader: true,
          logPrint: (object) {
            dPrint(object.toString());
          }));
    }

    return dio;
  }
}
//dio.options.headers['Authorization'] = 'Bearer $token';
extension DioHeader on Dio {

  void updateHeader(String language) {
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      // + _preferences.getData(AppPreferences.userToken, ""),
      ACCEPT_Language: language,
      // _preferences.getData(AppPreferences.lang, AppStrings.defaultLanguage),
      // DEFAULT_LANGUAGE: language
    };

    options = BaseOptions(

        baseUrl: ApiUrls.baseUrl,
        headers: headers,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30)
    );
  }
}
