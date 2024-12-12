import 'package:flutter/material.dart';
import 'package:weather_app/utils/sizes.dart';

class ForecastInfoItem extends StatelessWidget {
  final String label;
  final String value;
  const ForecastInfoItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: Sizes.md,
            color: Colors.grey
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: Sizes.md
          ),
        )
      ],
    );
  }
}