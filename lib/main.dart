import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:weather_app/core/bootstrap/notifier_providers.dart';
import 'package:weather_app/core/bootstrap/use_cases.dart';
import 'package:weather_app/utils/provider_persist.dart';

import 'core/app.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final useCases = getUseCases();
  final appStateProvider = getChangeNotifierProviders();

  List<SingleChildWidget> providers = [];

  providers.addAll(useCases);
  providers.addAll(appStateProvider);

  runApp(
    MultiProvider(
      providers: providers,
      child: const ProviderPersist(
        child: App()
      ),
    )
  );
}

