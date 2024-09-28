enum WeatherType {
  clear,
  partlyCloudy,
  cloudy,
  windy,
  rain,
  showers,
  snow,
  thunderstorm;

  String get url => switch (this) {
        WeatherType.clear => "assets/icons/weather-sun.svg",
        WeatherType.partlyCloudy => "assets/icons/weather-cloud-sun.svg",
        WeatherType.cloudy => "assets/icons/weather-clouds.svg",
        WeatherType.windy => "assets/icons/weather-windy.svg",
        WeatherType.rain => "assets/icons/weather-raindrops.svg",
        WeatherType.showers => "assets/icons/weather-cloud-showers-heavy.svg",
        WeatherType.snow => "assets/icons/weather-cloud-snow.svg",
        WeatherType.thunderstorm => "assets/icons/weather-thunderstorm.svg",
      };
}

extension WeatherTypeExtension on WeatherType {
  static WeatherType fromString(String weather) {
    switch (weather) {
      case "clear":
        return WeatherType.clear;
      case "partlyCloudy":
        return WeatherType.partlyCloudy;
      case "cloudy":
        return WeatherType.cloudy;
      case "windy":
        return WeatherType.windy;
      case "rain":
        return WeatherType.rain;
      case "showers":
        return WeatherType.showers;
      case "snow":
        return WeatherType.snow;
      case "thunderstorm":
        return WeatherType.thunderstorm;
      default:
        throw Exception("Invalid type");
    }
  }
}
