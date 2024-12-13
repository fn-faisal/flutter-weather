import 'package:flutter/material.dart';
import 'package:weather_app/domain/entities/timezone.dart';
import 'package:weather_app/presentation/molecules/weather_search_bar.dart';
import 'package:weather_app/presentation/organism/forecast_list_slider.dart';
import 'package:weather_app/utils/sizes.dart';

class HomePageTemplate extends StatelessWidget {

  final String searchBarPlaceholder;
  final Future<List<Timezone>> Function(String) onSearchTimezone;
  final void Function(Timezone)? onSelectTimezone;

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