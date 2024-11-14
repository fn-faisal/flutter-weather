import 'package:flutter/material.dart';
import 'package:weather_app/utils/sizes.dart';

class WeatherBadgeHour extends StatelessWidget {
  final String time;
  final String temp;

  const WeatherBadgeHour({super.key, required this.time, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.lg,
          horizontal: Sizes.sm,
        ),
        child: Column(
          children: [
            Text(temp, style: const TextStyle( fontSize: Sizes.lg ),),
            const SizedBox(
              height: Sizes.sm,
            ),
            Text(time),
          ],
        ),
      ),
    );
  }
}