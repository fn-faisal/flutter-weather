
import 'package:weather_app/domain/entities/city_entity.dart';

abstract class ICityRepository {
  Future<List<CityEntity>> all();
}