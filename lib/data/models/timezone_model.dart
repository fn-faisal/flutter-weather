
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/domain/entities/timezone.dart';

class TimezoneModel extends ChangeNotifier {
  Timezone? _selectedTimezone;

  List<Timezone> _timezones = [];

  Future<UnmodifiableListView<Timezone>> get timezones async {
    final prefs = await SharedPreferences.getInstance();
    final String? timezonesJson = prefs.getString('_savedTimezones');

    if (timezonesJson != null) {
      final List<dynamic> decodedList = jsonDecode(timezonesJson);
      _timezones = decodedList.map((json) => Timezone.fromJson(json)).toList();
    }
  
    return UnmodifiableListView(_timezones);
  }

  Timezone? get selectedTimezone => _selectedTimezone;

  void changeSelectedTimezone(Timezone newTimezone) {
    _selectedTimezone = newTimezone;
    var foundTimezone = _timezones
      .where(
        (c) => c.name == newTimezone.name,
      ).firstOrNull;
    if (foundTimezone == null) {
      addTimezone(newTimezone);
    }
    notifyListeners();
  }

  void addTimezone(Timezone timezone) async {
    _timezones.add(timezone);
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    final String citiesJson = jsonEncode(_timezones.map((timezone) => timezone.toJson()).toList());
    prefs.setString('_savedTimezones', citiesJson);
  }
}