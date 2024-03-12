import 'package:weather_app/common/models/day_weather/day_weather_model.dart';
import 'package:weather_app/common/models/hourly_weather/hourly_weather_model.dart';

abstract interface class IWeatherBox {
  Future<DayWeatherModel> getDayWeather();

  Future putDayWeather(DayWeatherModel weather);

  Future<HourlyWeatherModel> getHourlyWeather();

  Future putHourlyWeather(HourlyWeatherModel weather);
}
