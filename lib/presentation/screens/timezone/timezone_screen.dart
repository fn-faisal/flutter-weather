import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/timezone_model.dart';
import 'package:weather_app/presentation/molecules/timezone_card.dart';
import 'package:weather_app/utils/sizes.dart';

class TimezoneScreen extends StatelessWidget {
  const TimezoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                SizedBox(
                  width: size.width / 1.5,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.timezones.length,
                    itemExtent: Sizes.xl * 2,
                    itemBuilder: (itmCtx, itmIdx) => 
                      Align(
                        alignment: Alignment.center,
                        child: TimezoneCard(
                          timezone: state.timezones[itmIdx],
                          onTap: () {
                            Provider.of<TimezoneModel>(context, listen: false)
                              .changeSelectedTimezone(state.timezones[itmIdx]);
                            Navigator.of(context)
                              .popUntil((r) => r.isFirst);
                          },
                        ),
                      )
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}