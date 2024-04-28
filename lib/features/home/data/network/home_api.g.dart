// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _HomeServiceClient implements HomeServiceClient {
  _HomeServiceClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://ihoneyherb.com/test-application/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BaseResponse<HomeEntity>> getHomeData(
    String authKey,
    String userId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'auth_key': authKey,
      'user_id': userId,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<HomeEntity>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              'home/home.php',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponse<HomeEntity>.fromJson(
      _result.data!,
      (json) => HomeEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponse<List<MoreProductEntity>>> getMoreProductsData(
    String authKey,
    String userId,
    String searchWith,
    String homeTypes,
    String itemCount,
    String limit,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'auth_key': authKey,
      'user_id': userId,
      'search_with': searchWith,
      'home_types': homeTypes,
      'item_count': itemCount,
      'limit': limit,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<List<MoreProductEntity>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              'products/search_filter.php',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BaseResponse<List<MoreProductEntity>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<MoreProductEntity>(
                  (i) => MoreProductEntity.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
