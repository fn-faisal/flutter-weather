import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/city_model.dart';
import 'package:weather_app/utils/sizes.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select City'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            TextButton( 
              onPressed: (){
                Navigator.pushNamed(context, '/select-city');
              },
              child: const Text('Add City')
            ),
            const SizedBox(
              height: Sizes.md,
            ),
            Consumer<CityModel>(
              builder: (_, state, __) =>
                Column(
                  children: [
                    for ( var c in state.cities ) 
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(c.name),
                        )
                      )
                  ]
                )
            )
          ],
        ),
      ),
    );
  }
}