
import 'package:weather_app/domain/entities/current_temperature.dart';
import 'package:weather_app/domain/repositories/i_temperature_repository.dart';

class CurrentTemperatureFromTimezoneUseCase {
  final ITemperatureRepository temperatureRepository;

  CurrentTemperatureFromTimezoneUseCase({
    required this.temperatureRepository
  });
  
  Future<CurrentTemperature> execute({
    required String timezone,
    int? days,
  }) {
    return temperatureRepository.findByTimezone(timezone, days: days ?? 1);
  }

  
}