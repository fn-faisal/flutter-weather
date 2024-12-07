import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/presentation/molecules/weather_search_bar.dart';
import 'package:weather_app/presentation/organism/forecast_list_slider.dart';
import 'package:weather_app/utils/sizes.dart';

class HomePageTemplate extends StatelessWidget {

  final String searchBarPlaceholder;

  const HomePageTemplate({
    super.key, 
    required this.searchBarPlaceholder,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: Sizes.xl,
            left: Sizes.lg,
            right: Sizes.lg
          ),
          child: WeatherSearchBar(
            placeholder: searchBarPlaceholder,
            onSearch: ( String query ) async {
              List<String> suggestions = [
                "Karachi/Pakistan",
              ];
              return suggestions.where((s) => s.toLowerCase().startsWith(query.toLowerCase())).toList();
            },
          )
        ),
        const ForecastListSlider(
          
        )
      ],
    );
  }
}