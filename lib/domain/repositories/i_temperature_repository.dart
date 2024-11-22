
import 'package:weather_app/domain/entities/current_temperature.dart';

abstract class ITemperatureRepository {
  Future<CurrentTemperature> findByTimezone(String timezone, { int days = 1 });
}