import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/domain/entities/current_temperature.dart';
import 'package:weather_app/utils/sizes.dart';

class ForecastCard extends StatelessWidget {
  final CurrentTemperature? forecast;
  const ForecastCard({
    super.key,
    required this.forecast
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/icons/weather/cloudy.svg',
          width: Sizes.lg * 10,
          height: Sizes.lg * 10,
          colorFilter: const ColorFilter.mode(
            Colors.blue, 
            BlendMode.srcIn,
          ),
        ),
        Column(
          children: [
            Text(
              forecast?.location.toString() ?? '',
              style: const TextStyle(
                fontSize: Sizes.lg,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "${forecast?.current.tempCelsius} '",
              style: const TextStyle(
                fontSize: Sizes.xl,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        )
      ],
    );
  }
}