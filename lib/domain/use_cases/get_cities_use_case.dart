

import 'package:weather_app/domain/entities/city_entity.dart';
import 'package:weather_app/domain/repositories/i_city_repository.dart';

class GetCitiesUseCase { 
  ICityRepository cityRepository;

  GetCitiesUseCase({required this.cityRepository });

  Future<List<CityEntity>> execute() =>
    cityRepository.all();
}