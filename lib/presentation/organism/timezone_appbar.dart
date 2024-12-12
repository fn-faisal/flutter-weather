import 'package:flutter/material.dart';
import 'package:weather_app/utils/sizes.dart';

class TimezoneAppbar extends StatelessWidget {
  final String title;
  final void Function()? onSaveTimezone;

  const TimezoneAppbar({super.key, required this.title, this.onSaveTimezone});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: Sizes.lg
          ),
          child: TextButton(
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.blue),
              foregroundColor: WidgetStatePropertyAll(Colors.white)
            ),
            onPressed: (){
              if ( onSaveTimezone != null ) {
                onSaveTimezone!();
              }
            }, 
            child: const Text("Add +")
          ),
        )
      ],
    );
  }
}