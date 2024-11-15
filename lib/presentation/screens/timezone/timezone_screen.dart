import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/timezone_model.dart';
import 'package:weather_app/presentation/molecules/timezone_card.dart';
import 'package:weather_app/utils/sizes.dart';

class TimezoneScreen extends StatelessWidget {
  const TimezoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a timezone'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            TextButton( 
              onPressed: (){
                Navigator.pushNamed(context, '/select-timezone');
              },
              child: const Text('Add timezone')
            ),
            const SizedBox(
              height: Sizes.md,
            ),
            Consumer<TimezoneModel>(
              builder: (_, state, __) =>
                Column(
                  children: [
                    for ( final c in state.timezones ) 
                      TimezoneCard(
                        timezone: c,
                        onTap: () {
                          Provider.of<TimezoneModel>(context, listen: false)
                            .changeSelectedTimezone(c);
                          Navigator.of(context)
                            .popUntil((r) => r.isFirst);
                        },
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