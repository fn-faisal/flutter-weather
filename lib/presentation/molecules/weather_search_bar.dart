import 'dart:async';
import 'dart:developer';
import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';

List<String> _suggestions = [
  "Sunny",
  "Cloudy",
  "Rainy",
  "Thunderstorms",
  "Snow",
  "Foggy",
  "Windy",
  "Overcast",
  "Partly Cloudy",
  "Freezing Rain",
];

class WeatherSearchBar extends StatefulWidget {

  final String placeholder;

  const WeatherSearchBar({super.key, required this.placeholder});

  @override
  State<WeatherSearchBar> createState() => _WeatherSearchBarState();
}

class _WeatherSearchBarState extends State<WeatherSearchBar> {
  final searchController = SearchController();
  List<String> suggestions = [];
  bool isLoading = false;

  Completer<List<String>> _completer = Completer();

  late final Debouncer _debouncer = Debouncer(const Duration(milliseconds: 300),
    initialValue: '',
    onChanged: (value) {
      _completer.complete(_fetchSuggestions(value)); // call the API endpoint
    }
  );

  Future<List<String>> _fetchSuggestions(String query) async {
    return _suggestions.where((s) => s.toLowerCase().startsWith(query.toLowerCase())).toList();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      searchController: searchController,  
      builder: (context, controller) => 
        SearchBar(
          controller: controller,
          onTap: () => searchController.openView(),
          onChanged: (_) => searchController.openView(),
        ),
      suggestionsBuilder: (context, controller) async { 
        _debouncer.value = controller.text;
        _completer = Completer();
        return [FutureBuilder(
          future: _completer.future, 
          builder: (context, snapshot){ 
            final data = snapshot.data;
            if ( isLoading ) {
              return const CircularProgressIndicator();
            }
            if ( data == null || data.isEmpty ) {
              return ListTile(
                title: const Text('No results'),
                onTap: () {
                  searchController.closeView('');
                },
              );
            }
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: ListTile(
                    title: Text(data[index]),
                    onTap: () {
                      searchController.closeView(data[index]);
                    },
                  ),
                );
              },
            );
          }
        )];
      },
    );
  }
}