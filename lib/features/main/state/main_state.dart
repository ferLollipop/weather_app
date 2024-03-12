import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/common/models/day_weather/day_weather_model.dart';
import 'package:weather_app/common/models/hourly_weather/hourly_weather_model.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    DayWeatherModel? day,
    HourlyWeatherModel? hourly,
  }) = _MainState;
}
