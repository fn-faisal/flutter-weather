import 'package:flutter/material.dart';
import 'package:weather_app/utils/sizes.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width / 1.5,
      child: const Card(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Sizes.lg
          ),
          child: Column(
            children: [
              Text('17\'C', style: TextStyle( fontSize: Sizes.xl ),),
              SizedBox(height: 12.0, width: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Mostly sunny', style: TextStyle( fontSize: Sizes.md )),
                  SizedBox(height: 12.0, width: 10,),
                  Text('14 ~ 32 \'C', style: TextStyle( fontSize: Sizes.md )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}