
import 'package:json_annotation/json_annotation.dart';

part 'aqi.g.dart';

@JsonSerializable()
class Aqi {
  final double co;
  final double no2;
  final double o3;
  final double so2;

  Aqi({
    required this.co,
    required this.no2,
    required this.o3,
    required this.so2,
  });

  factory Aqi.fromJson(Map<String, dynamic> json)
    => _$AqiFromJson(json);
  
  Map<String, dynamic> toJson()
    => _$AqiToJson(this);
}