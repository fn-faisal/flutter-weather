
import 'package:json_annotation/json_annotation.dart';

part 'aq.g.dart';

@JsonSerializable()
class Aq {
  final double co;
  final double no2;
  final double o3;
  final double so2;

  @JsonKey(name: 'us-epa-index')
  final int usEpaIndex;

  @JsonKey(name: 'gb-defra-index')
  final int gbDefraIndex;

  Aq({
    required this.co,
    required this.no2,
    required this.o3,
    required this.so2,
    required this.usEpaIndex,
    required this.gbDefraIndex
  });

  factory Aq.fromJson(Map<String, dynamic> json)
    => _$AqFromJson(json);
  
  Map<String, dynamic> toJson()
    => _$AqToJson(this);
}