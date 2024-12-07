import 'package:flutter/material.dart';
import 'package:weather_app/presentation/organism/forecast_list_item.dart';
import 'package:weather_app/utils/sizes.dart';

class TimezonePageTemplate extends StatelessWidget {
  final String appBarTitleText;
  final void Function()? onSaveTimezone;

  const TimezonePageTemplate({
    super.key,
    required this.appBarTitleText,
    this.onSaveTimezone
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitleText),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: Sizes.lg
            ),
            child: TextButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
                foregroundColor: WidgetStatePropertyAll(Colors.white)
              ),
              onPressed: onSaveTimezone, 
              child: const Text("Add +")
            ),
          )
        ],
      ),
      body: const Wrap(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Sizes.md,
              horizontal: Sizes.xl
            ),
            child: ForecastListItem(),
          ),
        ],
      ),
    );
  }
}