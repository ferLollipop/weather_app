import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/common/di/infra_module.dart';
import 'package:weather_app/common/logs/logs.dart';
import 'package:weather_app/common/models/day_weather/day_weather_model.dart';
import 'package:weather_app/common/models/hourly_weather/hourly_weather_model.dart';
import 'package:weather_app/common/providers/weather/box/weather_box_abstraction.dart';
import 'package:weather_app/common/services/json_decode_service.dart';

part 'weather_box_provider.g.dart';

@riverpod
IWeatherBox weatherBox(WeatherBoxRef ref) {
  return WeatherBoxProvider(
    ref.watch(jsonDecodeServiceProvider),
    ref.watch(loggerProvider),
  );
}

class WeatherBoxProvider implements IWeatherBox {
  final Box _boxDay;
  final Box _boxHourly;
  final JsonDecodeService _jsonDS;
  final Logs _logs;

  WeatherBoxProvider(this._jsonDS, this._logs)
      : _boxDay = Hive.box(name: boxDay),
        _boxHourly = Hive.box(name: boxHourly) {
    init();
  }

  void init() async {
    Hive.registerAdapter('DayWeatherModel', DayWeatherModel.fromJson);
    Hive.registerAdapter('HourlyWeatherModel', HourlyWeatherModel.fromJson);
  }

  static const boxDay = 'weather_day';
  static const boxHourly = 'weather_hourly';
  final _boxDayWeatherKey = 'day_weather';
  final _boxHourlyWeatherKey = 'day_weather';

  @override
  Future<DayWeatherModel> getDayWeather() async {
    final res = _boxDay.get(_boxDayWeatherKey);

    final result = await _jsonDS.run(
      jsonDecoder: (json) {
        return DayWeatherModel.fromJson(json);
      },
      data: res,
    );

    return result;
  }

  @override
  Future putDayWeather(DayWeatherModel weather) async {
    try {
      _boxDay.put(_boxDayWeatherKey, weather.toJson());
    } catch (e, s) {
      _logs.e(e, e, s);
    }
  }

  @override
  Future<HourlyWeatherModel> getHourlyWeather() async {
    final res = _boxHourly.get(_boxHourlyWeatherKey);

    final result = await _jsonDS.run(
      jsonDecoder: (json) {
        return HourlyWeatherModel.fromJson(json);
      },
      data: res,
    );

    return result;
  }

  @override
  Future putHourlyWeather(HourlyWeatherModel weather) async {
    try {
      _boxHourly.put(_boxHourlyWeatherKey, weather.toJson());
    } catch (e, s) {
      _logs.e(e, e, s);
    }
  }
}
