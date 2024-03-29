// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DayWeatherModel _$DayWeatherModelFromJson(Map<String, dynamic> json) {
  return _DayWeatherModel.fromJson(json);
}

/// @nodoc
mixin _$DayWeatherModel {
  List<Weather> get weather => throw _privateConstructorUsedError;
  Main get main => throw _privateConstructorUsedError;
  Wind get wind => throw _privateConstructorUsedError;
  int get dt => throw _privateConstructorUsedError;
  Sys get sys => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DayWeatherModelCopyWith<DayWeatherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayWeatherModelCopyWith<$Res> {
  factory $DayWeatherModelCopyWith(
          DayWeatherModel value, $Res Function(DayWeatherModel) then) =
      _$DayWeatherModelCopyWithImpl<$Res, DayWeatherModel>;
  @useResult
  $Res call(
      {List<Weather> weather,
      Main main,
      Wind wind,
      int dt,
      Sys sys,
      String name});

  $MainCopyWith<$Res> get main;
  $WindCopyWith<$Res> get wind;
  $SysCopyWith<$Res> get sys;
}

/// @nodoc
class _$DayWeatherModelCopyWithImpl<$Res, $Val extends DayWeatherModel>
    implements $DayWeatherModelCopyWith<$Res> {
  _$DayWeatherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weather = null,
    Object? main = null,
    Object? wind = null,
    Object? dt = null,
    Object? sys = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<Weather>,
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as Main,
      wind: null == wind
          ? _value.wind
          : wind // ignore: cast_nullable_to_non_nullable
              as Wind,
      dt: null == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int,
      sys: null == sys
          ? _value.sys
          : sys // ignore: cast_nullable_to_non_nullable
              as Sys,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MainCopyWith<$Res> get main {
    return $MainCopyWith<$Res>(_value.main, (value) {
      return _then(_value.copyWith(main: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WindCopyWith<$Res> get wind {
    return $WindCopyWith<$Res>(_value.wind, (value) {
      return _then(_value.copyWith(wind: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SysCopyWith<$Res> get sys {
    return $SysCopyWith<$Res>(_value.sys, (value) {
      return _then(_value.copyWith(sys: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DayWeatherModelImplCopyWith<$Res>
    implements $DayWeatherModelCopyWith<$Res> {
  factory _$$DayWeatherModelImplCopyWith(_$DayWeatherModelImpl value,
          $Res Function(_$DayWeatherModelImpl) then) =
      __$$DayWeatherModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Weather> weather,
      Main main,
      Wind wind,
      int dt,
      Sys sys,
      String name});

  @override
  $MainCopyWith<$Res> get main;
  @override
  $WindCopyWith<$Res> get wind;
  @override
  $SysCopyWith<$Res> get sys;
}

/// @nodoc
class __$$DayWeatherModelImplCopyWithImpl<$Res>
    extends _$DayWeatherModelCopyWithImpl<$Res, _$DayWeatherModelImpl>
    implements _$$DayWeatherModelImplCopyWith<$Res> {
  __$$DayWeatherModelImplCopyWithImpl(
      _$DayWeatherModelImpl _value, $Res Function(_$DayWeatherModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weather = null,
    Object? main = null,
    Object? wind = null,
    Object? dt = null,
    Object? sys = null,
    Object? name = null,
  }) {
    return _then(_$DayWeatherModelImpl(
      weather: null == weather
          ? _value._weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<Weather>,
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as Main,
      wind: null == wind
          ? _value.wind
          : wind // ignore: cast_nullable_to_non_nullable
              as Wind,
      dt: null == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int,
      sys: null == sys
          ? _value.sys
          : sys // ignore: cast_nullable_to_non_nullable
              as Sys,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DayWeatherModelImpl implements _DayWeatherModel {
  const _$DayWeatherModelImpl(
      {required final List<Weather> weather,
      required this.main,
      required this.wind,
      required this.dt,
      required this.sys,
      required this.name})
      : _weather = weather;

  factory _$DayWeatherModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DayWeatherModelImplFromJson(json);

  final List<Weather> _weather;
  @override
  List<Weather> get weather {
    if (_weather is EqualUnmodifiableListView) return _weather;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weather);
  }

  @override
  final Main main;
  @override
  final Wind wind;
  @override
  final int dt;
  @override
  final Sys sys;
  @override
  final String name;

  @override
  String toString() {
    return 'DayWeatherModel(weather: $weather, main: $main, wind: $wind, dt: $dt, sys: $sys, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayWeatherModelImpl &&
            const DeepCollectionEquality().equals(other._weather, _weather) &&
            (identical(other.main, main) || other.main == main) &&
            (identical(other.wind, wind) || other.wind == wind) &&
            (identical(other.dt, dt) || other.dt == dt) &&
            (identical(other.sys, sys) || other.sys == sys) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_weather), main, wind, dt, sys, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DayWeatherModelImplCopyWith<_$DayWeatherModelImpl> get copyWith =>
      __$$DayWeatherModelImplCopyWithImpl<_$DayWeatherModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DayWeatherModelImplToJson(
      this,
    );
  }
}

abstract class _DayWeatherModel implements DayWeatherModel {
  const factory _DayWeatherModel(
      {required final List<Weather> weather,
      required final Main main,
      required final Wind wind,
      required final int dt,
      required final Sys sys,
      required final String name}) = _$DayWeatherModelImpl;

  factory _DayWeatherModel.fromJson(Map<String, dynamic> json) =
      _$DayWeatherModelImpl.fromJson;

  @override
  List<Weather> get weather;
  @override
  Main get main;
  @override
  Wind get wind;
  @override
  int get dt;
  @override
  Sys get sys;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$DayWeatherModelImplCopyWith<_$DayWeatherModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
