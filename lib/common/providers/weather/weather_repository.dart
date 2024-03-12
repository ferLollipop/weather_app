import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/common/di/infra_module.dart';
import 'package:weather_app/common/logs/logs.dart';
import 'package:weather_app/common/models/day_weather/day_weather_model.dart';
import 'package:weather_app/common/models/hourly_weather/hourly_weather_model.dart';
import 'package:weather_app/common/providers/weather/api/weather_provider.dart';
import 'package:weather_app/common/providers/weather/box/weather_box_abstraction.dart';
import 'package:weather_app/common/providers/weather/box/weather_box_provider.dart';
import 'package:weather_app/common/providers/weather/weather_abstraction.dart';
import 'package:weather_app/common/services/connectivity_service.dart';

part 'weather_repository.g.dart';

@riverpod
IWeather weatherRepository(WeatherRepositoryRef ref) {
  return WeatherRepository(
    ref.watch(weatherProvider),
    ref.watch(weatherBoxProvider),
    ref.watch(connectivityServiceProvider.notifier),
    ref.watch(loggerProvider),
  );
}

class WeatherRepository implements IWeather {
  final IWeather _api;
  final IWeatherBox _box;
  final ConnectivityService _connectivityResult;
  final Logs _logs;

  const WeatherRepository(
    this._api,
    this._box,
    this._connectivityResult,
    this._logs,
  );

  @override
  Future<DayWeatherModel> getDayWeather(double lat, double lon) async {
    if (!(await _connectivityResult.isHaveInternet())) {
      return _box.getDayWeather();
    }
    try {
      final res = await _api.getDayWeather(lat, lon);
      _box.putDayWeather(res);
      return res;
    } catch (e, s) {
      _logs.e(e, e, s);
      return _box.getDayWeather();
    }
  }

  @override
  Future<HourlyWeatherModel> getHourlyWeather(double lat, double lon) async {
    if (!(await _connectivityResult.isHaveInternet())) {
      return _box.getHourlyWeather();
    }
    try {
      final res = await _api.getHourlyWeather(lat, lon);
      _box.putHourlyWeather(res);
      return res;
    } catch (e, s) {
      _logs.e(e, e, s);
      return _box.getHourlyWeather();
    }
  }
}
