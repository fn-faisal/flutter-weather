
import 'package:weather_app/domain/entities/timezone.dart';
import 'package:weather_app/domain/repositories/i_timezone_repository.dart';

class FindTimezonByNameUseCase { 
  final ITimezoneRepository timezoneRepository;

  FindTimezonByNameUseCase({
    required this.timezoneRepository,
  });

  Future<List<Timezone>> execute( String name ){
    return timezoneRepository.findByName(name);
  }
}
