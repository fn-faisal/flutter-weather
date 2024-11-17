import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/timezone_model.dart';
import 'package:weather_app/presentation/molecules/clickable_asset.dart';
import 'package:weather_app/presentation/screens/home/widgets/hourly_weather.dart';
import 'package:weather_app/presentation/screens/home/widgets/summary.dart';
import 'package:weather_app/utils/sizes.dart';
import 'package:flutter_gen/gen_l10n/messages_locales.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void onTapTimezone (BuildContext context) {
    Navigator.pushNamed(context, '/timezone');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Consumer<TimezoneModel>(builder: (context, state, child){
              return Text(state.selectedTimezone?.name ?? MessagesLocales.of(context)!.no_tz_selected);
            }),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm),
              child: ClickableAsset(
                onTap: () {
                  onTapTimezone(context);
                }, 
                assetPath: 'assets/icons/edit.svg',
                color: Colors.grey
              )
            )
          ],
        ),
      ),
      body: const Center(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Summary(),
            HourlyWeather(),
            Text('AQI'),
          ],
        ),
      ),
    );
  }
}