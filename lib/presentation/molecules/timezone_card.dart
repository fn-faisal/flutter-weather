import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/timezone_model.dart';
import 'package:weather_app/domain/entities/timezone.dart';
import 'package:weather_app/utils/sizes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TimezoneCard extends StatelessWidget {

  final Timezone timezone;
  final VoidCallback? onTap;
  final bool? removeable;

  const TimezoneCard({super.key, required this.timezone, this.onTap, this.removeable = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.md,
            horizontal: Sizes.lg
          ),
          child: Row(
            children: [
              Expanded(
                child: Text('${timezone.name} / ${timezone.region} / ${timezone.country}')
              ),
              if ( removeable == true )
                TextButton(
                  onPressed: (){
                    Provider.of<TimezoneModel>(context, listen: false)
                      .removeTimezone(timezone);
                  }, 
                  child: Text(AppLocalizations.of(context)!.lbl_remove)
                )
            ],
          ),
        ),
      ),
    );
  }
}