import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/timezone_model.dart';
import 'package:weather_app/presentation/molecules/timezone_card.dart';
import 'package:weather_app/utils/sizes.dart';

class TimezoneScreen extends StatelessWidget {
  const TimezoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
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
                FutureBuilder(
                  future: state.timezones, 
                  builder: (tzCtx, tzSnapshot) {
                    if (tzSnapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (tzSnapshot.hasError) {
                      return Center(child: Text('Error: ${tzSnapshot.error}'));
                    } else if (tzSnapshot.hasData) {
                      final timezones = tzSnapshot.data;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: timezones?.length ?? 0,
                        itemBuilder: (itmCtx, itmIdx) => 
                          Align(
                            alignment: Alignment.center,
                            child: TimezoneCard(
                              timezone: timezones![itmIdx],
                              onTap: () {
                                Provider.of<TimezoneModel>(context, listen: false)
                                  .changeSelectedTimezone(timezones[itmIdx]);
                                Navigator.of(context)
                                  .popUntil((r) => r.isFirst);
                              },
                            ),
                          )
                      );
                    } else {
                      return const Center(child: Text('No data available'));
                    }
                  }
                ),
            )
          ],
        ),
      ),
    );
  }
}