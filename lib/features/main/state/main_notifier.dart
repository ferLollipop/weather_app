import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/common/di/infra_module.dart';
import 'package:weather_app/common/logs/logs.dart';
import 'package:weather_app/common/models/day_weather/day_weather_model.dart';
import 'package:weather_app/common/models/hourly_weather/hourly_weather_model.dart';
import 'package:weather_app/common/providers/weather/weather_abstraction.dart';
import 'package:weather_app/common/providers/weather/weather_repository.dart';
import 'package:weather_app/common/utils/ref_keep_providers_extension.dart';
import 'package:weather_app/features/main/state/main_state.dart';

part 'main_notifier.g.dart';

@riverpod
class MainNotifier extends _$MainNotifier {
  IWeather get _weatherProvider => ref.read(weatherRepositoryProvider);

  Logs get _log => ref.read(loggerProvider);

  @override
  AsyncValue<MainState> build() {
    ref.keepProviders([
      weatherRepositoryProvider,
      loggerProvider,
    ]);

    return const AsyncValue.loading();
  }

  Future fetchWeather(double lat, double lon) async {
    final day = await _fetchDayWeather(lat, lon);
    final hourly = await _fetchHourlyWeather(lat, lon);
    state = AsyncData(
      MainState(
        hourly: hourly,
        day: day,
      ),
    );
  }

  Future<DayWeatherModel?> _fetchDayWeather(double lat, double lon) async {
    try {
      return await _weatherProvider.getDayWeather(lat, lon);
    } catch (e, s) {
      _log.e(e, e, s);
      state = AsyncError(e, s);
    }
    return null;
  }

  Future<HourlyWeatherModel?> _fetchHourlyWeather(double lat, double lon) async {
    try {
      return await _weatherProvider.getHourlyWeather(lat, lon);
    } catch (e, s) {
      _log.e(e, e, s);
      state = AsyncError(e, s);
    }
    return null;
  }

  void setError(Object error, StackTrace stackTrace) {
    state = AsyncError(error, stackTrace);
  }
}
