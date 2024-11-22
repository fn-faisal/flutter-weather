
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/utils/date_from_epoch.dart';
import 'package:weather_app/utils/date_to_epoch.dart';

part 'forecast_hour.g.dart';

@JsonSerializable()
class ForecastHour {

  @JsonKey(
    name: 'time_epoch',
    fromJson: dateFromEpoch,
    toJson: dateToEpoch
  )
  final DateTime time;

  @JsonKey(name: 'temp_c')
  final double tempC;

  @JsonKey(name: 'temp_f')
  final double tempF;

  ForecastHour({
    required this.time,
    required this.tempC,
    required this.tempF
  });

  factory ForecastHour.fromJson(Map<String, dynamic> json)
    => _$ForecastHourFromJson(json);
  
  Map<String, dynamic> toJson()
    => _$ForecastHourToJson(this);
}