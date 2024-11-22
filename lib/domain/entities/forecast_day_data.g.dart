// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDayData _$ForecastDayDataFromJson(Map<String, dynamic> json) =>
    ForecastDayData(
      minTempF: (json['mintemp_f'] as num).toDouble(),
      maxTempC: (json['maxtemp_c'] as num).toDouble(),
      maxTempF: (json['maxtemp_f'] as num).toDouble(),
      minTempC: (json['mintemp_c'] as num).toDouble(),
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastDayDataToJson(ForecastDayData instance) =>
    <String, dynamic>{
      'maxtemp_c': instance.maxTempC,
      'mintemp_c': instance.minTempC,
      'maxtemp_f': instance.maxTempF,
      'mintemp_f': instance.minTempF,
      'condition': instance.condition,
    };
