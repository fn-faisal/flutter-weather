import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/presentation/molecules/weather_search_bar.dart';
import 'package:weather_app/presentation/organism/forecast_list_slider.dart';
import 'package:weather_app/utils/get_screen_size.dart';
import 'package:weather_app/utils/sizes.dart';

class HomePageTemplate extends StatelessWidget {

  final String searchBarPlaceholder;
  final Future<List<String>> Function(String) onSearchTimezone;
  final void Function(String)? onSelectTimezone;

  const HomePageTemplate({
    super.key, 
    required this.searchBarPlaceholder,
    required this.onSearchTimezone,
    this.onSelectTimezone
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: Sizes.xl,
              left: Sizes.lg,
              right: Sizes.lg
            ),
            child: WeatherSearchBar(
              placeholder: searchBarPlaceholder,
              onSearch: onSearchTimezone,
              onSelectTimezone: onSelectTimezone,
            )
          ),
          const ForecastListSlider()
        ],
      ),
    );
  }
}