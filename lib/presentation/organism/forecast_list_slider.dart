import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/presentation/organism/forecast_detail.dart';
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
    return Column(
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
            viewportFraction: 0.9,
            // height: double.infinity,
            height: getScreenSize(context).height,
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
                  horizontal: Sizes.md
                ),
                child: const ForecastDetail()
              )
            )
          ).toList(),
        ),
      ],
    );
  }
}