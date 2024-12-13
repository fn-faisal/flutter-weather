import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/entities/current_temperature.dart';
import 'package:weather_app/domain/entities/timezone.dart';
import 'package:weather_app/domain/use_cases/current_temperature_from_timezone_use_case.dart';
import 'package:weather_app/domain/use_cases/find_timezone_by_name_use_case.dart';
import 'package:weather_app/presentation/templates/home_page_template.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CurrentTemperature? currentTemperature;
  String? errorMessage;
  String? lastTimezone;

  // Future<void> _fetchCurrentTemperature(String timezone) async {
  //   try {
  //     final result = await Provider.of<CurrentTemperatureFromTimezoneUseCase>(context, listen: false)
  //         .execute(timezone: timezone, days: 7);
  //     setState(() {
  //       currentTemperature = result;
  //       errorMessage = null;
  //     });
  //   } catch (error) {
  //     setState(() {
  //       errorMessage = AppLocalizations.of(context)!.err_unknown;
  //     });
  //   }
  // }

  Future<List<Timezone>> _searchTimezoneByName(String searchString) async {
    try {
      return await Provider.of<FindTimezoneByNameUseCase>(context, listen: false)
          .execute(searchString);
    } catch (error) {
      setState(() {
        errorMessage = AppLocalizations.of(context)!.err_unknown;
      });
      log(error.toString());
      return [];
    }
  }

  void onTapTimezone (BuildContext context, Timezone timezone) {
    Navigator.pushNamed(context, '/forecast', arguments: timezone);
  }

  @override
  Widget build(BuildContext context) {  
    // final selectedTimezone = context.select<TimezoneModel, String?>((provider) => provider.selectedTimezone?.name);
    return HomePageTemplate(
      searchBarPlaceholder: AppLocalizations.of(context)!.lbl_search_bar,
      onSelectTimezone: (timezone) {
        onTapTimezone(context, timezone);
      },
      onSearchTimezone: _searchTimezoneByName,
    );
  }
}