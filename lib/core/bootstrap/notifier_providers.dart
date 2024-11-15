
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/timezone_model.dart';

List<ChangeNotifierProvider<dynamic>> getChangeNotifierProviders() => [
  ChangeNotifierProvider<TimezoneModel>(create: (_) => TimezoneModel())
];