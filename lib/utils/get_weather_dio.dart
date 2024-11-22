
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Dio getWeatherDio() {
  final wApiHost = dotenv.env['WEATHER_API_HOST'];
  final wApiKey = dotenv.env['WEATHER_API_KEY'];

  if ( wApiKey == null || wApiHost == null ) {
    throw Exception('API config missing');
  }

  var dio = Dio( BaseOptions(baseUrl: wApiHost) );
  dio.options.queryParameters.putIfAbsent('key', () => wApiKey);
  return dio;

}