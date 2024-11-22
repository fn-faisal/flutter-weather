
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/entities/condition.dart';
import 'package:weather_app/domain/entities/forecast_day_data.dart';
import 'package:weather_app/domain/entities/forecast_hour.dart';
import 'package:weather_app/utils/date_from_epoch.dart';
import 'package:weather_app/utils/date_to_epoch.dart';

part 'forecast_day.g.dart';

@JsonSerializable()
class ForecastDay {
  @JsonKey(
    name: 'date_epoch',
    fromJson: dateFromEpoch,
    toJson: dateToEpoch
  )
  final DateTime date;

  final ForecastDayData day;

  @JsonKey(name: 'hour')
  final List<ForecastHour> hourly;

  ForecastDay({
    required this.date,
    required this.day,
    required this.hourly
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) =>
    _$ForecastDayFromJson(json);

  Map<String, dynamic> toJson() =>
    _$ForecastDayToJson(this);
}