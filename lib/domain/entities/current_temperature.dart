
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/entities/temprature.dart';
import 'package:weather_app/domain/entities/timezone.dart';

part 'current_temperature.g.dart';

@JsonSerializable()
class CurrentTemperature {
  final Temperature current;
  final Timezone location;

  CurrentTemperature({
    required this.current,
    required this.location
  });

  factory CurrentTemperature.fromJson(Map<String, dynamic> json)
    =>_$CurrentTemperatureFromJson(json);

  Map<String, dynamic> toJson()
    => _$CurrentTemperatureToJson(this);
}