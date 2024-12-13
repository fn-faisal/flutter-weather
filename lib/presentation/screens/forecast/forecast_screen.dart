import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/entities/current_temperature.dart';
import 'package:weather_app/domain/entities/timezone.dart';
import 'package:weather_app/domain/use_cases/current_temperature_from_timezone_use_case.dart';
import 'package:weather_app/presentation/templates/forecast_page_template.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({super.key});

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  // late final Future<CurrentTemperature> forecast;
  CurrentTemperature? forecast;
  String? errorMessage;
  bool loading = false;
  bool initialLoad = false;

  Future<void> _fetchCurrentTemperature(Timezone timezone) async {
    try {
      setState(() {
        loading = true;
      });
      final result = await Provider.of<CurrentTemperatureFromTimezoneUseCase>(context, listen: false)
          .execute(timezoneId: timezone.id!, days: 7);
      log("Fetched TZ: ${result.location.toString()}");
      setState(() {
        forecast = result;
        errorMessage = null;
      });
      // return result;
    } catch (error) {
      log(error.toString());
      setState(() {
        errorMessage = AppLocalizations.of(context)!.err_unknown;
      });
    } finally {
      setState(() {
        if ( initialLoad == false ) {
          initialLoad = true;
        }
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if ( forecast == null && !initialLoad ) {
      Timezone timezone = ModalRoute.of(context)!.settings.arguments as Timezone;
      _fetchCurrentTemperature(timezone);
    }
    return Builder(
      builder: (context) => ForecastPageTemplate(
        loading: loading,
        appBarTitleText: AppLocalizations.of(context)!.lbl_save_timezone,
        forecast: forecast,
        onSaveTimezone: () {
          
        },
      ),
    );
  }
}