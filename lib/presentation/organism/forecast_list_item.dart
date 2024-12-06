import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/presentation/molecules/forecast_card.dart';
import 'package:weather_app/presentation/molecules/forecast_info_item.dart';
import 'package:weather_app/utils/sizes.dart';

class ForecastListItem extends StatelessWidget {
  const ForecastListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ForecastCard(),
        SizedBox(
          height: Sizes.xl,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ForecastInfoItem(
              label: 'Time', 
              value: '11:00 AM'
            ),
            ForecastInfoItem(
              label: 'UV', 
              value: '4'
            ),
            ForecastInfoItem(
              label: 'Rain Changes', 
              value: '5%'
            ),
            ForecastInfoItem(
              label: 'AQ', 
              value: '22'
            ),
          ],
        )
      ]
    );
  }
}