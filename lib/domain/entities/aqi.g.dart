// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aqi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Aqi _$AqiFromJson(Map<String, dynamic> json) => Aqi(
      co: (json['co'] as num).toDouble(),
      no2: (json['no2'] as num).toDouble(),
      o3: (json['o3'] as num).toDouble(),
      so2: (json['so2'] as num).toDouble(),
    );

Map<String, dynamic> _$AqiToJson(Aqi instance) => <String, dynamic>{
      'co': instance.co,
      'no2': instance.no2,
      'o3': instance.o3,
      'so2': instance.so2,
    };
