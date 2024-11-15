
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:weather_app/domain/entities/timezone.dart';

class TimezoneModel extends ChangeNotifier {
  Timezone? _selectedTimezone;

  final List<Timezone> _timezones = [];

  UnmodifiableListView<Timezone> get timezones => UnmodifiableListView(_timezones);
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
}