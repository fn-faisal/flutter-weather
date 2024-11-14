
import 'dart:collection';

import 'package:flutter/material.dart';

class CityModel extends ChangeNotifier {
  late String _selectedCity = '';

  final List<String> _cities = [];

  UnmodifiableListView<String> get cities => UnmodifiableListView(_cities);
  String get selectedCity => _selectedCity;

  void changeCity(String newCity) {
    _selectedCity = newCity;
    if (!_cities.contains(newCity)) {
      addCity(newCity);
    }
    notifyListeners();
  }

  void addCity(String city) {
    _cities.add(city);
    notifyListeners();
  }
}