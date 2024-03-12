// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DayWeatherModelImpl _$$DayWeatherModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DayWeatherModelImpl(
      weather: (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: Main.fromJson(json['main'] as Map<String, dynamic>),
      wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
      dt: json['dt'] as int,
      sys: Sys.fromJson(json['sys'] as Map<String, dynamic>),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$DayWeatherModelImplToJson(
        _$DayWeatherModelImpl instance) =>
    <String, dynamic>{
      'weather': instance.weather,
      'main': instance.main,
      'wind': instance.wind,
      'dt': instance.dt,
      'sys': instance.sys,
      'name': instance.name,
    };
