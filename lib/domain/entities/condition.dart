
import 'package:json_annotation/json_annotation.dart';

part 'condition.g.dart';

@JsonSerializable()
class Condition {
  final String text;
  final String? icon;
  final int code;

  Condition({
    required this.text,
    required this.code,
    this.icon
  });

  factory Condition.fromJson(Map<String, dynamic> json)
    => _$ConditionFromJson(json);

  Map<String, dynamic> toJson()
    => _$ConditionToJson(this);

}