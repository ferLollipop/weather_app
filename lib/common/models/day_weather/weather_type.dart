import 'package:weather_app/generated/assets.gen.dart';

enum WeatherType {
  thunderstorm('Thunderstorm'),
  drizzle('Drizzle'),
  rain('Rain'),
  snow('Snow'),
  atmosphere('Atmosphere'),
  clear('Clear'),
  clouds('Clouds'),
  unknown('');

  final String type;

  const WeatherType(this.type);

  static WeatherType fromJson(String? type) {
    return WeatherType.values.firstWhere(
      (element) => element.type == type,
      orElse: () => WeatherType.unknown,
    );
  }

  static String toJson(WeatherType value) {
    return value.type;
  }

  AssetGenImage get getImageByType {
    return switch (this) {
      WeatherType.thunderstorm => Assets.images.storm,
      WeatherType.drizzle => Assets.images.heavyRain,
      WeatherType.rain => Assets.images.rain,
      WeatherType.snow => Assets.images.snow,
      WeatherType.atmosphere => Assets.images.cloudy,
      WeatherType.clear => Assets.images.sunny,
      WeatherType.clouds => Assets.images.cloudy,
      WeatherType.unknown => Assets.images.sunny,
    };
  }

  SvgGenImage get getSvgByType {
    return switch (this) {
      WeatherType.thunderstorm => Assets.icons.cloudStorm,
      WeatherType.drizzle => Assets.icons.cloudRain,
      WeatherType.rain => Assets.icons.cloudRain,
      WeatherType.snow => Assets.icons.cloudSnow,
      WeatherType.atmosphere => Assets.icons.cloudMoon,
      WeatherType.clear => Assets.icons.cloudSun,
      WeatherType.clouds => Assets.icons.cloudMoon,
      WeatherType.unknown => Assets.icons.cloudSun,
    };
  }
}
