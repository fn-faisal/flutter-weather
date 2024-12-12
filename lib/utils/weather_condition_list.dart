class WeatherCondition {
  final int code;
  final String day;
  final String night;
  final int icon;
  final String assetPath;

  WeatherCondition({
    required this.code,
    required this.day,
    required this.night,
    required this.icon,
    required this.assetPath,
  });

  factory WeatherCondition.fromJson(Map<String, dynamic> json) {
    return WeatherCondition(
      code: json['code'],
      day: json['day'],
      night: json['night'],
      icon: json['icon'],
      assetPath: json['assetPath'] ?? '', // Fallback for JSON without assetPath
    );
  }
}

final List<WeatherCondition> weatherConditionsMap = [
  WeatherCondition(
    code: 1000,
    day: "Sunny",
    night: "Clear",
    icon: 113,
    assetPath: "assets/weather/sunny.svg",
  ),
  WeatherCondition(
    code: 1003,
    day: "Partly Cloudy",
    night: "Partly Cloudy",
    icon: 116,
    assetPath: "assets/weather/partly_cloudy.svg",
  ),
  WeatherCondition(
    code: 1006,
    day: "Cloudy",
    night: "Cloudy",
    icon: 119,
    assetPath: "assets/weather/cloudy.svg",
  ),
  WeatherCondition(
    code: 1009,
    day: "Overcast",
    night: "Overcast",
    icon: 122,
    assetPath: "assets/weather/overcast.svg",
  ),
  WeatherCondition(
    code: 1030,
    day: "Mist",
    night: "Mist",
    icon: 143,
    assetPath: "assets/weather/mist.svg",
  ),
  WeatherCondition(
    code: 1063,
    day: "Patchy Rain Possible",
    night: "Patchy Rain Possible",
    icon: 176,
    assetPath: "assets/weather/patchy_rain.svg",
  ),
  WeatherCondition(
    code: 1087,
    day: "Thunderstorms Possible",
    night: "Thunderstorms Possible",
    icon: 200,
    assetPath: "assets/weather/thunderstorm.svg",
  ),
  WeatherCondition(
    code: 1117,
    day: "Blizzard",
    night: "Blizzard",
    icon: 230,
    assetPath: "assets/weather/blizzard.svg",
  ),
  WeatherCondition(
    code: 1135,
    day: "Fog",
    night: "Fog",
    icon: 248,
    assetPath: "assets/weather/fog.svg",
  ),
  WeatherCondition(
    code: 1150,
    day: "Patchy Drizzle",
    night: "Patchy Drizzle",
    icon: 263,
    assetPath: "assets/weather/patchy_drizzle.svg",
  ),
  WeatherCondition(
    code: 1183,
    day: "Light Rain",
    night: "Light Rain",
    icon: 296,
    assetPath: "assets/weather/light_rain.svg",
  ),
  WeatherCondition(
    code: 1195,
    day: "Heavy Rain",
    night: "Heavy Rain",
    icon: 308,
    assetPath: "assets/weather/heavy_rain.svg",
  ),
  WeatherCondition(
    code: 1210,
    day: "Light Snow",
    night: "Light Snow",
    icon: 323,
    assetPath: "assets/weather/light_snow.svg",
  ),
  WeatherCondition(
    code: 1225,
    day: "Heavy Snow",
    night: "Heavy Snow",
    icon: 338,
    assetPath: "assets/weather/heavy_snow.svg",
  ),
  WeatherCondition(
    code: 1240,
    day: "Light Rain Shower",
    night: "Light Rain Shower",
    icon: 353,
    assetPath: "assets/weather/light_rain_shower.svg",
  ),
  WeatherCondition(
    code: 1273,
    day: "Thunderstorm with Light Rain",
    night: "Thunderstorm with Light Rain",
    icon: 386,
    assetPath: "assets/weather/thunderstorm_rain.svg",
  ),
  WeatherCondition(
    code: 1279,
    day: "Thunderstorm with Light Snow",
    night: "Thunderstorm with Light Snow",
    icon: 392,
    assetPath: "assets/weather/thunderstorm_snow.svg",
  ),
  WeatherCondition(
    code: 0000,
    day: "Unknown",
    night: "Unknown",
    icon: 392,
    assetPath: "assets/weather/unknown.svg",
  ),
];
