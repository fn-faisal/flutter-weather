
import 'package:weather_app/domain/entities/current_temperature.dart';

abstract class ITemperatureRepository {
  Future<CurrentTemperature> forecastById(int timezoneId, { int days = 1 });
}