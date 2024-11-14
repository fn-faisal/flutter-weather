import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/city_model.dart';
import 'package:weather_app/domain/entities/city_entity.dart';
import 'package:weather_app/domain/use_cases/get_cities_use_case.dart';
import 'package:weather_app/presentation/screens/select_city/widgets/search_form.dart';
import 'package:weather_app/utils/sizes.dart';

class SelectCityScreen extends StatefulWidget {
  const SelectCityScreen({super.key});

  @override
  State<SelectCityScreen> createState() => _SelectCityState();
  
}

class _SelectCityState extends State<SelectCityScreen> {

  List<CityEntity> searchResult = [];

  void setResult(List<CityEntity> newResults) {
    setState(() {
      searchResult = newResults;
    });
  }

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
          child: Column(
            children: [
              CitySearhForm(
                onSearch: (String name) async {
                  var cities = await Provider.of<GetCitiesUseCase>(context, listen: false)
                      .execute();
                  setResult(cities);
                },
              ),
              const SizedBox(
                height: Sizes.lg,
              ),
              Column(
                children: [
                  for ( var c in searchResult ) 
                    InkWell(
                      onTap: () {
                        Provider.of<CityModel>(context, listen: false)
                          .changeCity(c);
                        Navigator.of(context)
                          .popUntil((r) => r.isFirst);
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: Sizes.md,
                            horizontal: Sizes.lg
                          ),
                          child: Text(c.name),
                        ),
                      ),
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