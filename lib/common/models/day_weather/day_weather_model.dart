import 'package:freezed_annotation/freezed_annotation.dart';

import 'main.dart';
import 'sys.dart';
import 'weather.dart';
import 'wind.dart';

part 'day_weather_model.freezed.dart';
part 'day_weather_model.g.dart';

@freezed
class DayWeatherModel with _$DayWeatherModel {
  const factory DayWeatherModel({
    required List<Weather> weather,
    required Main main,
    required Wind wind,
    required int dt,
    required Sys sys,
    required String name,
  }) = _DayWeatherModel;

  factory DayWeatherModel.fromJson(dynamic json) => _$DayWeatherModelFromJson(json);
}
