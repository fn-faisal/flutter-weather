import 'package:flutter/material.dart';
import 'package:weather_app/domain/entities/timezone.dart';
import 'package:weather_app/utils/sizes.dart';

class TimezoneCard extends StatelessWidget {

  final Timezone timezone;
  final VoidCallback? onTap;

  const TimezoneCard({super.key, required this.timezone, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.md,
            horizontal: Sizes.lg
          ),
          child: Text('${timezone.name} / ${timezone.region} / ${timezone.country}'),
        ),
      ),
    );
  }
}