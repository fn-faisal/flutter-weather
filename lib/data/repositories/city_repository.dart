
import 'package:weather_app/domain/entities/city_entity.dart';
import 'package:weather_app/domain/repositories/i_city_repository.dart';

class CityRepository extends ICityRepository {
  @override
  Future<List<CityEntity>> all() {
    return Future.value([
      CityEntity.fromJson({ 'name': 'Test City' })
    ]);
  }
}