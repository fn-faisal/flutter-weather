
import 'package:provider/provider.dart';
import 'package:weather_app/data/repositories/timezone_http_repository.dart';
import 'package:weather_app/domain/use_cases/find_timezon_by_name_use_case.dart';

List<Provider<dynamic>> getUseCases() =>
  [
    Provider<FindTimezonByNameUseCase>
      .value(value: FindTimezonByNameUseCase(
        timezoneRepository: TimezoneHttpRepository()
      )
    ),
  ];