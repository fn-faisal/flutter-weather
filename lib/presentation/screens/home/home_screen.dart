import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/entities/current_temperature.dart';
import 'package:weather_app/domain/use_cases/current_temperature_from_timezone_use_case.dart';
import 'package:weather_app/presentation/templates/home_page_template.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CurrentTemperature? currentTemperature;
  String? errorMessage;
  String? lastTimezone;

  Future<void> _fetchCurrentTemperature(String timezone) async {
    try {
      final result = await Provider.of<CurrentTemperatureFromTimezoneUseCase>(context, listen: false)
          .execute(timezone: timezone, days: 7);
      setState(() {
        currentTemperature = result;
        errorMessage = null;
      });
    } catch (error) {
      setState(() {
        errorMessage = 'An error occurred';
      });
    }
  }

  void onTapTimezone (BuildContext context) {
    Navigator.pushNamed(context, '/timezone');
  }

  @override
  Widget build(BuildContext context) {  
    // final selectedTimezone = context.select<TimezoneModel, String?>((provider) => provider.selectedTimezone?.name);
    return HomePageTemplate(
      searchBarPlaceholder: 'Search Location',
      onSelectTimezone: (timezone) {
        Navigator.pushNamed(context, '/timezone');
      },
      onSearchTimezone: (query) async {
        List<String> suggestions = [
          "Karachi/Pakistan",
        ];
        return suggestions.where((s) => s.toLowerCase().startsWith(query.toLowerCase())).toList();
      },
    );
  }
}