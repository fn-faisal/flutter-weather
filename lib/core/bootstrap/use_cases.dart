
import 'package:provider/provider.dart';
import 'package:weather_app/data/repositories/temperature_http_repository.dart';
import 'package:weather_app/data/repositories/timezone_http_repository.dart';
import 'package:weather_app/domain/use_cases/current_temperature_from_timezone_use_case.dart';
import 'package:weather_app/domain/use_cases/find_timezon_by_name_use_case.dart';

List<Provider<dynamic>> getUseCases() =>
  [
    Provider<CurrentTemperatureFromTimezoneUseCase>
      .value( value: CurrentTemperatureFromTimezoneUseCase(
        temperatureRepository: TemperatureHttpRepository()
      ) 
    ),
    Provider<FindTimezonByNameUseCase>
      .value(value: FindTimezonByNameUseCase(
        timezoneRepository: TimezoneHttpRepository()
      )
    ),
  ];