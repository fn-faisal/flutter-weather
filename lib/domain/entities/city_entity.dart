import 'package:json_annotation/json_annotation.dart';

part 'city_entity.g.dart';

@JsonSerializable()
class CityEntity {
  final String name;

  CityEntity({ required this.name }); 

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory CityEntity.fromJson(Map<String, dynamic> json) => _$CityEntityFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$CityEntityToJson(this);
}