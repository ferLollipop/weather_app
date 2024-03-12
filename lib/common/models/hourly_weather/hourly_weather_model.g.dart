// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HourlyWeatherModelImpl _$$HourlyWeatherModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HourlyWeatherModelImpl(
      list: (json['list'] as List<dynamic>)
          .map((e) => Hour.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HourlyWeatherModelImplToJson(
        _$HourlyWeatherModelImpl instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
