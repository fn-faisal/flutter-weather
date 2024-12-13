
import 'package:weather_app/domain/entities/timezone.dart';
import 'package:weather_app/domain/repositories/i_timezone_repository.dart';
import 'package:weather_app/domain/use_cases/i_use_case.dart';

class FindTimezoneByNameUseCase implements IUseCase<List<Timezone>, String> { 
  final ITimezoneRepository timezoneRepository;

  FindTimezoneByNameUseCase({
    required this.timezoneRepository,
  });

  @override
  Future<List<Timezone>> execute( String name ){
    return timezoneRepository.findByName(name);
  }
}
