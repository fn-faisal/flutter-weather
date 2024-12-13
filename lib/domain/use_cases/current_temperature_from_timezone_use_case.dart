
import 'package:weather_app/domain/entities/current_temperature.dart';
import 'package:weather_app/domain/repositories/i_temperature_repository.dart';

class CurrentTemperatureFromTimezoneUseCase {
  final ITemperatureRepository temperatureRepository;

  CurrentTemperatureFromTimezoneUseCase({
    required this.temperatureRepository
  });
  
  Future<CurrentTemperature> execute({
    required int timezoneId,
    int? days,
  }) {
    return temperatureRepository.forecastById(timezoneId, days: days ?? 1);
  }

  
}