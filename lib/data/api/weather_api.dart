import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';
import 'package:weather_app/domain/entities/current_temperature.dart';
import 'package:weather_app/domain/entities/timezone.dart';

part 'weather_api.g.dart';

@RestApi()
abstract class WeatherApi {
  factory WeatherApi(Dio dio, { String? baseUrl}) = _WeatherApi;

  @GET('/search.json')
  Future<List<Timezone>> search(@Query('q') String q);

  @GET('/forecast.json')
  Future<CurrentTemperature> current(@Query('q') String q);
}