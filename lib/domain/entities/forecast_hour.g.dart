// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_hour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastHour _$ForecastHourFromJson(Map<String, dynamic> json) => ForecastHour(
      time: dateFromEpoch((json['time_epoch'] as num).toInt()),
      tempC: (json['temp_c'] as num).toDouble(),
      tempF: (json['temp_f'] as num).toDouble(),
    );

Map<String, dynamic> _$ForecastHourToJson(ForecastHour instance) =>
    <String, dynamic>{
      'time_epoch': dateToEpoch(instance.time),
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
    };
