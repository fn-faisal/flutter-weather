
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/entities/condition.dart';

part 'forecast_day_data.g.dart';

@JsonSerializable()
class ForecastDayData {
  @JsonKey(name: 'maxtemp_c')
  final double maxTempC;

  @JsonKey(name: 'mintemp_c')
  final double minTempC;

  @JsonKey(name: 'maxtemp_f')
  final double maxTempF;

  @JsonKey(name: 'mintemp_f')
  final double minTempF;

  @JsonKey(name: 'condition')
  final Condition condition;

  ForecastDayData({
    required this.minTempF,
    required this.maxTempC,
    required this.maxTempF,
    required this.minTempC,
    required this.condition,
  });

  factory ForecastDayData.fromJson(Map<String, dynamic> json)
    => _$ForecastDayDataFromJson(json);
  
  Map<String, dynamic> toJson()
    => _$ForecastDayDataToJson(this);

}