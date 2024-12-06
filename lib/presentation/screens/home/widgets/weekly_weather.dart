import 'package:flutter/material.dart';
import 'package:weather_app/presentation/molecules/weather_badge_day.dart';

class WeeklyWeather extends StatelessWidget {
  const WeeklyWeather({super.key});

  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;
    return SizedBox(
      width: sizes.width / 1.5,
      child: const Row(
        children: [
          WeatherBadgeDay(
            temp: '24\'C',
            day: 'Mon', 
          ),
          WeatherBadgeDay(
            temp: '25\'C',
            day: 'Tue', 
          ),
          WeatherBadgeDay(
            temp: '25\'C',
            day: 'Wed', 
          )
        ],
      ),
    );
  }
}