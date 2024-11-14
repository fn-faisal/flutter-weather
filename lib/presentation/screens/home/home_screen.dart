import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/city_model.dart';
import 'package:weather_app/presentation/molecules/clickable_asset.dart';
import 'package:weather_app/presentation/screens/home/widgets/hourly_weather.dart';
import 'package:weather_app/presentation/screens/home/widgets/summary.dart';
import 'package:weather_app/utils/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void onTapCity (BuildContext context) {
    Navigator.pushNamed(context, '/city');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Consumer<CityModel>(builder: (context, state, child){
              return Text(state.selectedCity);
            }),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm),
              child: ClickableAsset(
                onTap: () {
                  onTapCity(context);
                }, 
                assetPath: 'assets/icons/edit.svg',
                color: Colors.grey
              )
            )
          ],
        ),
      ),
      body: const Center(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Summary(),
            HourlyWeather(),
            Text('AQI'),
          ],
        ),
      ),
    );
  }
}