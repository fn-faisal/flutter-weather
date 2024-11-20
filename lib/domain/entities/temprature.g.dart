// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temprature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Temperature _$TemperatureFromJson(Map<String, dynamic> json) => Temperature(
      lastUpdatedEpoch: (json['last_updated_epoch'] as num).toInt(),
      tempCelsius: (json['temp_c'] as num).toDouble(),
      tempFahrenheit: (json['temp_f'] as num).toDouble(),
      feelsLikeCelsius: (json['feelslike_c'] as num?)?.toDouble(),
      feelsLikeFahrenheit: (json['feelslike_f'] as num?)?.toDouble(),
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TemperatureToJson(Temperature instance) =>
    <String, dynamic>{
      'last_updated_epoch': instance.lastUpdatedEpoch,
      'temp_c': instance.tempCelsius,
      'temp_f': instance.tempFahrenheit,
      'feelslike_c': instance.feelsLikeCelsius,
      'feelslike_f': instance.feelsLikeFahrenheit,
      'condition': instance.condition,
    };
