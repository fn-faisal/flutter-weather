import 'package:flutter/material.dart';
import 'package:weather_app/utils/sizes.dart';

class WeatherBadgeDay extends StatelessWidget {
  final String day;
  final String temp;

  const WeatherBadgeDay({super.key, required this.day, required this.temp});

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
            Text(day),
          ],
        ),
      ),
    );
  }
}