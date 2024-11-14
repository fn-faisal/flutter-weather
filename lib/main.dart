import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/city_model.dart';
import 'package:weather_app/data/repositories/city_repository.dart';
import 'package:weather_app/domain/use_cases/get_cities_use_case.dart';

import 'core/app.dart';

void main() {
  final cityRepository = CityRepository();
  final getCitiesUseCase = GetCitiesUseCase(cityRepository: cityRepository);

  runApp(
    MultiProvider(
      providers: [
        Provider<GetCitiesUseCase>.value(value: getCitiesUseCase),
        ChangeNotifierProvider(create: (_) => CityModel())
      ],
      child: const App(),
    )
  );
}

