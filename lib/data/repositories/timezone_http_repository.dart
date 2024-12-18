import 'package:weather_app/data/api/weather_api.dart';
import 'package:weather_app/domain/entities/timezone.dart';
import 'package:weather_app/domain/repositories/i_timezone_repository.dart';
import 'package:weather_app/utils/get_weather_dio.dart';

class TimezoneHttpRepository implements ITimezoneRepository {
  @override
  Future<List<Timezone>> findByName(String name) {
    final dio = getWeatherDio();
    final client = WeatherApi(dio);
    return client.search(name);
  }
}