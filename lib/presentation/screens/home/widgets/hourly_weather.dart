import 'package:flutter/material.dart';
import 'package:weather_app/presentation/molecules/weather_badge_day.dart';
import 'package:weather_app/presentation/molecules/weather_badge_hour.dart';
import 'package:weather_app/utils/sizes.dart';

class HourlyWeather extends StatelessWidget {
  const HourlyWeather({super.key});

  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;
    return SizedBox(
      width: sizes.width / 1.5,
      child: const Column(
        children: [
          Row(
            children: [
              WeatherBadgeHour(
                temp: '24\'C',
                time: 'Mon', 
              ),
              WeatherBadgeHour(
                temp: '25\'C',
                time: 'Tue', 
              ),
              WeatherBadgeHour(
                temp: '25\'C',
                time: 'Wed', 
              )
            ],
          ),
          SizedBox(
            height: Sizes.lg,
          ),
          InkWell(
            child: Text('Show daily temperature'),
          ),
          SizedBox(
            height: Sizes.lg,
          ),
        ],
      ),
    );
  }
}