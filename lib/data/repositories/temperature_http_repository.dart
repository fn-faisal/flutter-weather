
import 'package:weather_app/data/api/weather_api.dart';
import 'package:weather_app/domain/entities/current_temperature.dart';
import 'package:weather_app/domain/repositories/i_temperature_repository.dart';
import 'package:weather_app/utils/get_weather_dio.dart';

class TemperatureHttpRepository implements ITemperatureRepository {
  @override
  Future<CurrentTemperature> forecastById(int timezoneId, { int days = 1 }) {
    final dio = getWeatherDio();
    final client = WeatherApi(dio);
    return client.forecast("id:$timezoneId", days);
  }

}