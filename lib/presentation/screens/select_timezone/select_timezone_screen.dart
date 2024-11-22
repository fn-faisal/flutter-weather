import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/timezone_model.dart';
import 'package:weather_app/domain/entities/timezone.dart';
import 'package:weather_app/domain/use_cases/find_timezon_by_name_use_case.dart';
import 'package:weather_app/presentation/molecules/timezone_card.dart';
import 'package:weather_app/presentation/screens/select_timezone/widgets/timezone_search_form.dart';
import 'package:weather_app/utils/sizes.dart';

class SelectTimezoneScreen extends StatefulWidget {
  const SelectTimezoneScreen({super.key});

  @override
  State<SelectTimezoneScreen> createState() => _SelectTimezoneState();
  
}

class _SelectTimezoneState extends State<SelectTimezoneScreen> {

  List<Timezone> searchResult = [];

  bool isLoading = false;

  void setResult(List<Timezone> newResults) {
    setState(() {
      searchResult = newResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;
    var showSnackbar = ScaffoldMessenger.of(context).showSnackBar;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Timezone')
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(
          top: Sizes.md
        ),
        child: SizedBox(
          width: sizes.width / 1.5,
          child: Column(
            children: [
              TimezoneSearhForm(
                onSearch: (String name) async {
                  try {
                    setState(() {
                      isLoading = true;
                    });
                    var timezones = await Provider.of<FindTimezonByNameUseCase>(context, listen: false)
                      .execute(name);
                    setResult(timezones);
                  } catch (e) { 
                    log(e.toString());
                    showSnackbar(
                        const SnackBar(content: Text('An error occurred!'))
                    );
                  } finally { 
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
              ),
              const SizedBox(
                height: Sizes.lg,
              ),
              Column(
                children: [
                  for ( var c in searchResult ) 
                    TimezoneCard(
                      removeable: false,
                      timezone: c,
                      onTap: (){
                        Provider.of<TimezoneModel>(context, listen: false)
                          .changeSelectedTimezone(c);
                        Navigator.of(context)
                          .popUntil((r) => r.isFirst);
                      },
                    )
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}