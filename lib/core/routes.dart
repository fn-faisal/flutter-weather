
import 'package:flutter/material.dart';
import 'package:weather_app/presentation/screens/city/city_screen.dart';
import 'package:weather_app/presentation/screens/home/home_screen.dart';
import 'package:weather_app/presentation/screens/select_city/select_city_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> guestRoutes = {
    '/': (context) => const HomeScreen(),
    '/city': (context) => const CityScreen(),
    '/select-city': (context) => const SelectCityScreen()
  };
}
