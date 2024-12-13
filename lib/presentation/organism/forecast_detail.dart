import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_app/domain/entities/current_temperature.dart';
import 'package:weather_app/presentation/molecules/forecast_card.dart';
import 'package:weather_app/presentation/molecules/forecast_hourly_chart.dart';
import 'package:weather_app/presentation/molecules/forecast_info_item.dart';
import 'package:weather_app/utils/sizes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForecastDetail extends StatelessWidget {
  final bool loading;
  final CurrentTemperature? forecast;
  
  const ForecastDetail({
    super.key,
    this.loading = false,
    required this.forecast
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        bottom: 300
      ),
      child: Skeletonizer(
        enabled: loading,
        child: Column(
            children: [
              ForecastCard(
                forecast: forecast,
              ),
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
                    value: forecast?.current.uv.toString() ?? '?'
                  ),
                  ForecastInfoItem(
                    label: AppLocalizations.of(context)!.lbl_txt_rain_percentage, 
                    value: '${forecast?.current.cloud ?? 0} %'
                  ),
                  ForecastInfoItem(
                    label: AppLocalizations.of(context)!.lbl_txt_aq, 
                    value: forecast?.current.airQuality?.usEpaIndex.toString() ?? '?'
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
      ),
    );
    
  }
}