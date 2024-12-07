import 'dart:async';
import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/utils/sizes.dart';

class WeatherSearchBar extends StatefulWidget {

  final String placeholder;
  final Future<List<String>> Function(String) onSearch;

  const WeatherSearchBar({super.key, required this.placeholder, required this.onSearch});

  @override
  State<WeatherSearchBar> createState() => _WeatherSearchBarState();
}

class _WeatherSearchBarState extends State<WeatherSearchBar> {
  final searchController = SearchController();
  List<String> suggestions = [];
  bool isLoading = false;

  Completer<List<String>> _completer = Completer();

  late final Debouncer _debouncer = Debouncer(const Duration(seconds: 1),
    initialValue: '',
    onChanged: (value) {
      _completer.complete(_fetchSuggestions(value)); // call the API endpoint
    }
  );

  Future<List<String>> _fetchSuggestions(String query) async {
    setState(() {
      isLoading = false;
    });
    if ( query.isEmpty ) {
      return [];
    }
    return await widget.onSearch(query);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      viewHintText: widget.placeholder,
      viewBackgroundColor: Colors.white,
      searchController: searchController,  
      builder: (context, controller) => 
        SearchBar(
          padding: const WidgetStatePropertyAll(
            EdgeInsets.only(
              left: Sizes.md
            )
          ),
          hintText: widget.placeholder,
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          backgroundColor: const WidgetStatePropertyAll(Colors.white),
          elevation: const WidgetStatePropertyAll(0),
          trailing: [
            Padding(
              padding: const EdgeInsets.only(
                right: Sizes.lg
              ),
              child: SvgPicture.asset(
                'assets/icons/search.svg',
                colorFilter: const ColorFilter.mode(
                  Colors.grey,
                  BlendMode.srcIn
                ),
              ),
            ),
          ],
          side:  const WidgetStatePropertyAll(BorderSide(
            color: Colors.grey
          )),
          controller: controller,
          onTap: () => searchController.openView(),
          onChanged: (_) => searchController.openView(),
        ),
      suggestionsBuilder: (context, controller) async { 
        setState(() {
          isLoading = true;
        });
        _debouncer.value = controller.text;
        _completer = Completer();
        return [FutureBuilder(
          future: _completer.future, 
          builder: (context, snapshot){ 
            final data = snapshot.data;
            if ( isLoading ) {
              return const ListTile(
                title: Wrap(children: [Center(child: CircularProgressIndicator())]),
              );
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