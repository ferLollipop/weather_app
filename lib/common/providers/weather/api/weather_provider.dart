import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/common/config/endpoints.dart';
import 'package:weather_app/common/models/day_weather/day_weather_model.dart';
import 'package:weather_app/common/models/hourly_weather/hourly_weather_model.dart';
import 'package:weather_app/common/network/api_client.dart';
import 'package:weather_app/common/providers/weather/weather_abstraction.dart';
import 'package:weather_app/common/services/json_decode_service.dart';

part 'weather_provider.g.dart';

@riverpod
IWeather weather(WeatherRef ref) {
  return WeatherProvider(
    ref.watch(apiClientProvider),
    ref.watch(endpointsProvider),
    ref.watch(jsonDecodeServiceProvider),
  );
}

class WeatherProvider implements IWeather {
  final APIClient _api;
  final Endpoints _endpoints;
  final JsonDecodeService _jsonDS;

  const WeatherProvider(
    this._api,
    this._endpoints,
    this._jsonDS,
  );

  @override
  Future<DayWeatherModel> getDayWeather(double lat, double lon) async {
    final response = await _api.client().get(
      _endpoints.weather.day,
      queryParameters: {
        'lat': lat,
        'lon': lon,
        'units': 'metric',
        'lang': 'ru',
      },
    );

    final result = await _jsonDS.run(
      jsonDecoder: (json) {
        return DayWeatherModel.fromJson(json);
      },
      data: response.data,
    );

    return result;
  }

  @override
  Future<HourlyWeatherModel> getHourlyWeather(double lat, double lon) async {
    final response = await _api.client().get(
      _endpoints.weather.hourly,
      queryParameters: {
        'lat': lat,
        'lon': lon,
        'units': 'metric',
        'lang': 'ru',
      },
    );

    final result = await _jsonDS.run(
      jsonDecoder: (json) {
        return HourlyWeatherModel.fromJson(json);
      },
      data: response.data,
    );

    return result;
  }
}
