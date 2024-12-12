import 'package:flutter/material.dart';
import 'package:weather_app/presentation/templates/timezone_page_template.dart';

class TimezoneScreen extends StatelessWidget {
  const TimezoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TimezonePageTemplate(
      appBarTitleText: 'Save timezone?',
      onSaveTimezone: () {
        
      },
    );
  }
}