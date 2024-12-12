import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/utils/sizes.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/icons/weather/cloudy.svg',
          width: Sizes.lg * 10,
          height: Sizes.lg * 10,
          colorFilter: ColorFilter.mode(
            Colors.blue, 
            BlendMode.srcIn,
          ),
        ),
        Column(
          children: [
            Text(
              "Timezone",
              style: TextStyle(
                fontSize: Sizes.lg,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "30'",
              style: TextStyle(
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