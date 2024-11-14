
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:weather_app/domain/entities/city_entity.dart';

class CityModel extends ChangeNotifier {
  CityEntity? _selectedCity;

  final List<CityEntity> _cities = [];

  UnmodifiableListView<CityEntity> get cities => UnmodifiableListView(_cities);
  CityEntity? get selectedCity => _selectedCity;

  void changeCity(CityEntity newCity) {
    _selectedCity = newCity;
    var foundCity = _cities
      .where(
        (c) => c.name == newCity.name,
      ).firstOrNull;
    if (foundCity == null) {
      addCity(newCity);
    }
    notifyListeners();
  }

  void addCity(CityEntity city) {
    _cities.add(city);
    notifyListeners();
  }
}