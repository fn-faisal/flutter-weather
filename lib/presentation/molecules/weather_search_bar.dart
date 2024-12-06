import 'package:flutter/material.dart';
import 'package:weather_app/presentation/molecules/clickable_asset.dart';

class WeatherSearchBar extends StatelessWidget {

  final String placeholder;

  const WeatherSearchBar({super.key, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      padding: const WidgetStatePropertyAll(
      EdgeInsets.only( left: 12.5, right: 20 )),
      backgroundColor: WidgetStatePropertyAll(Colors.grey[50]),
      elevation: const WidgetStatePropertyAll(0.0),
      hintText: placeholder,
      hintStyle: const WidgetStatePropertyAll(
      TextStyle(
        color: Color(0xFFC4C4C4)
        )
      ),
      trailing: [ClickableAsset(
        onTap: () => {}, 
        assetPath: 'assets/icons/search.svg'
      )],
    );
  }
}