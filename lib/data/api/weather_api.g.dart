// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _WeatherApi implements WeatherApi {
  _WeatherApi(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  });

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<List<Timezone>> search(String q) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'q': q};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<Timezone>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/search.json',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<Timezone> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => Timezone.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
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