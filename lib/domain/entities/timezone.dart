
import 'package:json_annotation/json_annotation.dart';

part 'timezone.g.dart';

@JsonSerializable()
class Timezone {
  final int? id;
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String? url;

  Timezone({ 
    this.id,
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    this.url
  });

  // Override equality operator
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Timezone && other.id == id;
  }

  factory Timezone.fromJson(Map<String, dynamic> json) => 
    _$TimezoneFromJson(json);

  Map<String, dynamic> toJson() => _$TimezoneToJson(this);
}