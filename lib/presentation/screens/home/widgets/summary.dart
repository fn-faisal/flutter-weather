import 'package:flutter/material.dart';
import 'package:weather_app/domain/entities/current_temperature.dart';
import 'package:weather_app/utils/sizes.dart';

class Summary extends StatelessWidget {

  final CurrentTemperature currentTemperature;

  const Summary({super.key, required this.currentTemperature});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width / 1.5,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.lg
          ),
          child: Column(
            children: [
              Text('${currentTemperature.current.tempCelsius}\'C', style: const TextStyle( fontSize: Sizes.xl ),),
              const SizedBox(height: 12.0, width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(currentTemperature.current.condition.text, style: const TextStyle( fontSize: Sizes.md )),
                  const SizedBox(height: 12.0, width: 10, child: Text(' : '),),
                  if(currentTemperature.current.feelsLikeCelsius != null)
                    Text('Feels like ${currentTemperature.current.feelsLikeCelsius}\'C', style: TextStyle( fontSize: Sizes.md )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}