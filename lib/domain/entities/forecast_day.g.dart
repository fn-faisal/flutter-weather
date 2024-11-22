// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDay _$ForecastDayFromJson(Map<String, dynamic> json) => ForecastDay(
      date: dateFromEpoch((json['date_epoch'] as num).toInt()),
      day: ForecastDayData.fromJson(json['day'] as Map<String, dynamic>),
      hourly: (json['hour'] as List<dynamic>)
          .map((e) => ForecastHour.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastDayToJson(ForecastDay instance) =>
    <String, dynamic>{
      'date_epoch': dateToEpoch(instance.date),
      'day': instance.day,
      'hour': instance.hourly,
    };
