import 'package:flutter/material.dart';
import 'package:weather_app/presentation/molecules/forecast_card.dart';
import 'package:weather_app/presentation/molecules/forecast_hourly_chart.dart';
import 'package:weather_app/presentation/molecules/forecast_info_item.dart';
import 'package:weather_app/utils/sizes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForecastDetail extends StatelessWidget {
  const ForecastDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        bottom: 300
      ),
      child: Column(
          children: [
            const ForecastCard(),
            const SizedBox(
              height: Sizes.xl,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ForecastInfoItem(
                  label: AppLocalizations.of(context)!.lbl_txt_time, 
                  value: '11:00 AM'
                ),
                ForecastInfoItem(
                  label: AppLocalizations.of(context)!.lbl_txt_uv, 
                  value: '4'
                ),
                ForecastInfoItem(
                  label: AppLocalizations.of(context)!.lbl_txt_rain_percentage, 
                  value: '5%'
                ),
                ForecastInfoItem(
                  label: AppLocalizations.of(context)!.lbl_txt_aq, 
                  value: '22'
                ),
              ],
            ),
            const SizedBox(
              height: Sizes.xl,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.lg
              ),
              child: ForecastHourlyChart(),
            )
          ]
        ),
    );
    
  }
}