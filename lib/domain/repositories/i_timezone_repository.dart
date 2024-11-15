
import 'package:weather_app/domain/entities/timezone.dart';

abstract class ITimezoneRepository {
  Future<List<Timezone>> findByName(String name);
}