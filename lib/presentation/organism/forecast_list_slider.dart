import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
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
        // Center(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(
        //       vertical: Sizes.lg
        //     ),
        //     child: DotsIndicator(
        //       decorator: const DotsDecorator(
        //         activeSize: Size.fromWidth(10),
        //         size: Size( Sizes.md, Sizes.md )
        //       ),
        //       dotsCount: items.length,
        //       position: currentIndex,
        //     ),
        //   ),
        // ),
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (idx, reason) {
              setState(() {
                currentIndex = idx;
              });
            }
            // height: Sizes.lg
          ),
          items: items.map(
            (weather) {
              return Builder(
                builder: (context) {
                  return const Text('Hello');
                }
              );
            }
          ).toList(),
        ),
      ],
    );
  }
}