// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_temperature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentTemperature _$CurrentTemperatureFromJson(Map<String, dynamic> json) =>
    CurrentTemperature(
      current: Temperature.fromJson(json['current'] as Map<String, dynamic>),
      location: Timezone.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentTemperatureToJson(CurrentTemperature instance) =>
    <String, dynamic>{
      'current': instance.current,
      'location': instance.location,
    };
