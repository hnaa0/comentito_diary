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
