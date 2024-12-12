import 'package:flutter/material.dart';
import 'package:weather_app/presentation/organism/forecast_detail.dart';
import 'package:weather_app/utils/sizes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              child: Text(
                AppLocalizations.of(context)!.btn_txt_add_timezone
              )
            ),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          // vertical: Sizes.md,
          horizontal: Sizes.xl
        ),
        child: ForecastDetail(),
      ),
    );
  }
}