import 'package:flutter/material.dart';
import 'package:weather_app/presentation/molecules/clickable_asset.dart';

class TimezoneSearhForm extends StatefulWidget {
  final Future<void> Function(String) onSearch;

  const TimezoneSearhForm({super.key, required this.onSearch});
  
  @override
  State<TimezoneSearhForm> createState() => _TimezoneSearhFormState();
}

class _TimezoneSearhFormState extends State<TimezoneSearhForm> {
  final _formKey = GlobalKey<FormState>();
  final timezonNameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: timezonNameCtrl,
            decoration: InputDecoration(
              label: const Text('Enter a timezone'),
              icon: ClickableAsset(
                onTap: () {
                  if(_formKey.currentState!.validate()) {
                    widget.onSearch(timezonNameCtrl.value.text);
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