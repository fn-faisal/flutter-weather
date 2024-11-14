import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/city_model.dart';
import 'package:weather_app/presentation/screens/select_city/widgets/search_form.dart';
import 'package:weather_app/utils/sizes.dart';

class SelectCityScreen extends StatelessWidget {
  const SelectCityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select City')
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(
          top: Sizes.md
        ),
        child: SizedBox(
          width: sizes.width / 1.5,
          child: const Column(
            children: [
              CitySearhForm(),
              SizedBox(
                height: Sizes.lg,
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Sizes.md,
                    horizontal: Sizes.lg
                  ),
                  child: Text('City'),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}