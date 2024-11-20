
import 'package:weather_app/domain/entities/current_temperature.dart';
import 'package:weather_app/domain/repositories/i_temperature_repository.dart';
import 'package:weather_app/domain/use_cases/i_use_case.dart';

class CurrentTemperatureFromTimezoneUseCase implements IUseCase<CurrentTemperature, String> {
  final ITemperatureRepository temperatureRepository;

  CurrentTemperatureFromTimezoneUseCase({
    required this.temperatureRepository
  });
  
  @override
  Future<CurrentTemperature> execute(String payload) {
    return temperatureRepository.findByTimezone(payload);
  }

  
}