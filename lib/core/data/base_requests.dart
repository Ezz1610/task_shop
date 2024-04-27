import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:task/core/app_utils/media_query_values.dart';
import 'package:task/core/data/network/error_handler.dart';
import 'package:http/http.dart' as http;

Future<Either<Failure, http.Response>> getRequest(
    {required String host,
    required String path,
    Map<String, dynamic>? queryParams}) async {

  try{
    dPrint('start Request');
    final client = http.Client();

    final uri = Uri.http(host, path, queryParams);
    var headers = {
      'Content-Type': 'application/json',
      'connection': 'keep-alive'
    };
    dPrint('host: $host');
    dPrint('path: $path');
    dPrint('queryParams: $queryParams');
    http.Response response = await client.get(uri, headers: headers).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response('الجهاز الرئيسي غير مشغل',
            408); // Request Timeout response status code
      },
    );
    dPrint('get Request');

    // dPrint(response.body.toString());
    if (response.statusCode == 200) {
      dPrint(response.toString());
      return Right(response);
    } else if (response.statusCode == 400) {
      return Left(Failure(400, 'الجهاز الرئيسي مغلق'));
    } else {
      return Left(Failure(401, response.body.toString()));
    }
  }catch (e){
    return Left(Failure(404, 'الجهاز الرئيسي مغلق'));
  }
}

Future<Either<Failure, http.Response>> postRequest(
    {required String host,
    required String path,
    Map<String, dynamic>? queryParams,
    required Map<String, dynamic> body}) async {
  final client = http.Client();
  final uri = Uri.http(host, path, queryParams);
  var headers = {
    'Content-Type': 'application/json',
    'connection': 'keep-alive',
    "Keep-Alive": "timeout=10, max=1000"
  };

  http.Response response =
      await client.post(uri, headers: headers, body: json.encode(body)).timeout(
    const Duration(seconds: 5),
    onTimeout: () {
      // Time has run out, do what you wanted to do.
      return http.Response(
          'Error', 408); // Request Timeout response status code
    },
  );
  if (response.statusCode == 200) {
    return Right(response);
  } else {
    return Left(Failure(401, 'طلب غير مكتمل'));
  }
}
