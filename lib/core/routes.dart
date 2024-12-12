
import 'package:flutter/material.dart';
import 'package:weather_app/presentation/screens/timezone/timezone_screen.dart';
import 'package:weather_app/presentation/screens/home/home_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> guestRoutes = {
    '/': (context) => const HomeScreen(),
    '/timezone': (context) => const TimezoneScreen(),
  };
}
