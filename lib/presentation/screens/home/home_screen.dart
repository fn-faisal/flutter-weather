import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/timezone_model.dart';
import 'package:weather_app/domain/entities/current_temperature.dart';
import 'package:weather_app/domain/use_cases/current_temperature_from_timezone_use_case.dart';
import 'package:weather_app/presentation/molecules/clickable_asset.dart';
import 'package:weather_app/presentation/molecules/weather_search_bar.dart';
import 'package:weather_app/presentation/screens/home/widgets/weekly_weather.dart';
import 'package:weather_app/presentation/screens/home/widgets/summary.dart';
import 'package:weather_app/presentation/templates/home_page_template.dart';
import 'package:weather_app/utils/sizes.dart';
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

    // Only fetch if selectedTimezone is non-null and changed
    // if (selectedTimezone != null && selectedTimezone != lastTimezone) {
    //   lastTimezone = selectedTimezone;
    //   _fetchCurrentTemperature(selectedTimezone);
    // }

    return Scaffold(
      // appBar: AppBar(
      //   title: Row(
      //     children: [
      //       // Text(lastTimezone ?? AppLocalizations.of(context)!.lbl_noTzSelected),
      //       Padding(
      //         padding: const EdgeInsets.only(left: Sizes.sm),
      //         child: ClickableAsset(
      //           onTap: () {
      //             onTapTimezone(context);
      //           }, 
      //           assetPath: 'assets/icons/edit.svg',
      //           color: Colors.grey
      //         )
      //       )
      //     ],
      //   ),
      // ),
      body: HomePageTemplate(
        searchBarPlaceholder: 'Search Location',
        onSearchTimezone: (query) async {
          List<String> suggestions = [
            "Karachi/Pakistan",
          ];
          return suggestions.where((s) => s.toLowerCase().startsWith(query.toLowerCase())).toList();
        },
      ),
        // child: Builder(
        //   builder: (context) {
        //     if (errorMessage != null) {
        //       return Text('Error: $errorMessage');
        //     } else if (currentTemperature == null) {
        //       return lastTimezone == null ? const Text('Please select a timezone.') : const CircularProgressIndicator();
        //     } else {
        //       return Column(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Summary( currentTemperature: currentTemperature!),
        //           // const HourlyWeather(),
        //           const Text('AQI'),
        //         ],
        //       );
        //     }            
        //   }
        // ),
    );
  }
}