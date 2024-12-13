import 'package:flutter/material.dart';
import 'package:weather_app/domain/entities/current_temperature.dart';
import 'package:weather_app/presentation/organism/forecast_detail.dart';
import 'package:weather_app/utils/sizes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForecastPageTemplate extends StatelessWidget {
  final String appBarTitleText;
  final void Function()? onSaveTimezone;
  final CurrentTemperature? forecast;
  final bool loading;
  const ForecastPageTemplate({
    super.key,
    required this.appBarTitleText,
    required this.forecast,
    this.onSaveTimezone,
    this.loading = false,
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
              child: Text(
                AppLocalizations.of(context)!.btn_txt_add_timezone
              )
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          // vertical: Sizes.md,
          horizontal: Sizes.xl
        ),
        child: ForecastDetail( loading: loading, forecast: forecast ),
      ),
    );
  }
}