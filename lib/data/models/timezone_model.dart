
import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/domain/entities/timezone.dart';

class TimezoneModel extends ChangeNotifier {
  Timezone? _selectedTimezone;

  List<Timezone> _timezones = [];

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final String? timezonesJson = prefs.getString('_savedTimezones');
    final String? selectedTimezoneJson = prefs.getString('_selectedTimezone');

    if (timezonesJson != null) {
      final List<dynamic> decodedList = jsonDecode(timezonesJson);
      _timezones = decodedList.map((json) => Timezone.fromJson(json)).toList();
    }

    if ( selectedTimezoneJson != null ) {
      final decodedSelectedTimezone = jsonDecode(selectedTimezoneJson);
      _selectedTimezone = Timezone.fromJson(decodedSelectedTimezone);
    }

    notifyListeners();
  }

  Future<void> saveState() async {
    final prefs = await SharedPreferences.getInstance();
    final String timezonesJson = jsonEncode(_timezones.map((timezone) => timezone.toJson()).toList());
    await prefs.setString('_savedTimezones', timezonesJson);

    if ( _selectedTimezone != null ) {
      await prefs.setString('_selectedTimezone', jsonEncode(_selectedTimezone!.toJson()));
    }
  }

  UnmodifiableListView<Timezone> get timezones => 
    UnmodifiableListView(_timezones);

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

  void addTimezone(Timezone timezone) {
    _timezones.add(timezone);
    notifyListeners();
  }

  void removeTimezone(Timezone timezone) {
    _timezones.remove(timezone);
    if ( selectedTimezone == timezone ) {
      _selectedTimezone = null;
    }
    notifyListeners();
  }
}