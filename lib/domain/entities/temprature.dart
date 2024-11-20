
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/entities/aqi.dart';
import 'package:weather_app/domain/entities/condition.dart';
import 'package:weather_app/utils/bool_from_int.dart';
import 'package:weather_app/utils/bool_to_int.dart';

part 'temprature.g.dart';

@JsonSerializable()
class Temperature {
  @JsonKey( name: 'last_updated_epoch' )
  final int lastUpdatedEpoch;

  // @JsonKey( name: 'last_updated' )
  // final int lastUpdated;

  @JsonKey( name: 'temp_c' )
  final double tempCelsius;

  @JsonKey( name: 'temp_f' )
  final double tempFahrenheit;

  // @JsonKey( 
  //   name: 'is_day',
  //   fromJson: boolFromInt,
  //   toJson: boolToInt,
  // )
  // final bool isDay;

  // final int humidity;
  // final int cloud;

  @JsonKey( name: 'feelslike_c' )
  final double? feelsLikeCelsius;

  @JsonKey( name: 'feelslike_f' )
  final double? feelsLikeFahrenheit;

  // final int uv;

  // @JsonKey(name: 'air_quality')
  // final Aqi aqi;

  final Condition condition;

  Temperature({
    required this.lastUpdatedEpoch,
    // required this.lastUpdated,
    required this.tempCelsius,
    required this.tempFahrenheit,
    // required this.isDay,
    // required this.cloud,
    this.feelsLikeCelsius,
    this.feelsLikeFahrenheit,
    // required this.humidity,
    // required this.uv,
    // required this.aqi,
    required this.condition
  });

  factory Temperature.fromJson(Map<String, dynamic> json) 
    => _$TemperatureFromJson(json); 
  
  Map<String, dynamic> toJson() 
    => _$TemperatureToJson(this);
}