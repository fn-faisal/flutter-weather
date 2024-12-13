// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Aq _$AqFromJson(Map<String, dynamic> json) => Aq(
      co: (json['co'] as num).toDouble(),
      no2: (json['no2'] as num).toDouble(),
      o3: (json['o3'] as num).toDouble(),
      so2: (json['so2'] as num).toDouble(),
      usEpaIndex: (json['us-epa-index'] as num).toInt(),
      gbDefraIndex: (json['gb-defra-index'] as num).toInt(),
    );

Map<String, dynamic> _$AqToJson(Aq instance) => <String, dynamic>{
      'co': instance.co,
      'no2': instance.no2,
      'o3': instance.o3,
      'so2': instance.so2,
      'us-epa-index': instance.usEpaIndex,
      'gb-defra-index': instance.gbDefraIndex,
    };
