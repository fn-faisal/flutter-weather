import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';
import 'package:weather_app/domain/entities/timezone.dart';

part 'weather_api.g.dart';

@RestApi()
abstract class WeatherApi {
  factory WeatherApi(Dio dio, { String? baseUrl}) = _WeatherApi;

  @GET('/search.json')
  Future<List<Timezone>> search(@Query('q') String q);
}