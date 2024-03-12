import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/common/models/day_weather/weather_type.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    @JsonKey(toJson: WeatherType.toJson, fromJson: WeatherType.fromJson) required WeatherType main,
    required String description,
  }) = _Weather;

  factory Weather.fromJson(Map<String, Object?> json) => _$WeatherFromJson(json);
}
