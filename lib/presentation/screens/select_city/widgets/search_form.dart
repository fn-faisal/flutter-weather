import 'package:flutter/material.dart';
import 'package:weather_app/presentation/molecules/clickable_asset.dart';

class CitySearhForm extends StatefulWidget {
  final Future<void> Function(String) onSearch;

  const CitySearhForm({super.key, required this.onSearch});
  
  @override
  State<CitySearhForm> createState() => _CitySearhFormState();
}

class _CitySearhFormState extends State<CitySearhForm> {
  final _formKey = GlobalKey<FormState>();
  final cityNameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: cityNameCtrl,
            decoration: InputDecoration(
              label: const Text('Enter a city name'),
              icon: ClickableAsset(
                onTap: () {
                  if(_formKey.currentState!.validate()) {
                    // Provider.of<CityModel>(context, listen: false)
                    //   .changeCity(cityNameCtrl.value.text);
                    widget.onSearch(cityNameCtrl.value.text);
                  }
                }, 
                assetPath: 'assets/icons/edit.svg'
              )
            ),
            validator: (value) {
              if ( value == null || value.isEmpty ) {
                return 'Please enter some text';
              }
              return null;
            },

          ),
        ],
      )
    );
  }
}