

import 'package:weather_app/domain/entities/city_entity.dart';
import 'package:weather_app/domain/repositories/i_city_repository.dart';

class SearchCityUseCase { 
  ICityRepository cityRepository;

  SearchCityUseCase({required this.cityRepository });

  Future<List<CityEntity>> execute( String name ) =>
    cityRepository.search(name);
}