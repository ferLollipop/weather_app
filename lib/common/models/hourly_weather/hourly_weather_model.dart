import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/common/models/hourly_weather/hour.dart';

part 'hourly_weather_model.freezed.dart';
part 'hourly_weather_model.g.dart';

@freezed
class HourlyWeatherModel with _$HourlyWeatherModel {
  const factory HourlyWeatherModel({
    required List<Hour> list,
  }) = _HourlyWeatherModel;

  factory HourlyWeatherModel.fromJson(dynamic json) => _$HourlyWeatherModelFromJson(json);
}
