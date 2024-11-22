
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/entities/forecast_day.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {

  @JsonKey(name: 'forecastday')
  final List<ForecastDay> forecastDay;

  Forecast({
    required this.forecastDay
  });

  factory Forecast.fromJson(Map<String, dynamic> json)
    => _$ForecastFromJson(json);
  
  Map<String, dynamic> toJson()
    => _$ForecastToJson(this);
}