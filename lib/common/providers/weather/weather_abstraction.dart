import 'package:weather_app/common/models/day_weather/day_weather_model.dart';
import 'package:weather_app/common/models/hourly_weather/hourly_weather_model.dart';

abstract interface class IWeather {
  Future<DayWeatherModel> getDayWeather(double lat, double lon);

  Future<HourlyWeatherModel> getHourlyWeather(double lat, double lon);
}
