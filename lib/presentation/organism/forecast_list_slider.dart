import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/presentation/organism/forecast_list_item.dart';
import 'package:weather_app/utils/get_screen_size.dart';
import 'package:weather_app/utils/sizes.dart';

class ForecastListSlider extends StatefulWidget {
  const ForecastListSlider({super.key});

  @override
  State<ForecastListSlider> createState() => _ForecastListSliderState();
}

class _ForecastListSliderState extends State<ForecastListSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<int> items = [1, 2, 3];
    var screenSize = getScreenSize(context);
    return Wrap(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.lg
            ),
            child: DotsIndicator(
              dotsCount: items.length,
              position: currentIndex,
            ),
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            height: screenSize.height / 1.25,
            onPageChanged: (idx, reason) {
              setState(() {
                currentIndex = idx;
              });
            }
            // height: Sizes.lg
          ),
          items: items.map(
            (weather) => Builder(
              builder: (context) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.lg * 1.5
                ),
                child: const ForecastListItem()
              )
            )
          ).toList(),
        ),
      ],
    );
  }
}