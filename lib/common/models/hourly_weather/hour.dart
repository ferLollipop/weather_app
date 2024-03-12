import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/common/models/day_weather/main.dart';
import 'package:weather_app/common/models/day_weather/weather.dart';
import 'package:weather_app/common/models/day_weather/wind.dart';

part 'hour.freezed.dart';
part 'hour.g.dart';

@freezed
class Hour with _$Hour {
  const factory Hour({
    required int dt,
    required Main main,
    required List<Weather> weather,
    required Wind wind,
    @JsonKey(name: 'dt_txt') required String dtTxt,
  }) = _Hour;

  factory Hour.fromJson(Map<String, Object?> json) => _$HourFromJson(json);
}
