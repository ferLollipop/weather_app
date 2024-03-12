// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hour.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Hour _$HourFromJson(Map<String, dynamic> json) {
  return _Hour.fromJson(json);
}

/// @nodoc
mixin _$Hour {
  int get dt => throw _privateConstructorUsedError;
  Main get main => throw _privateConstructorUsedError;
  List<Weather> get weather => throw _privateConstructorUsedError;
  Wind get wind => throw _privateConstructorUsedError;
  @JsonKey(name: 'dt_txt')
  String get dtTxt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HourCopyWith<Hour> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourCopyWith<$Res> {
  factory $HourCopyWith(Hour value, $Res Function(Hour) then) =
      _$HourCopyWithImpl<$Res, Hour>;
  @useResult
  $Res call(
      {int dt,
      Main main,
      List<Weather> weather,
      Wind wind,
      @JsonKey(name: 'dt_txt') String dtTxt});

  $MainCopyWith<$Res> get main;
  $WindCopyWith<$Res> get wind;
}

/// @nodoc
class _$HourCopyWithImpl<$Res, $Val extends Hour>
    implements $HourCopyWith<$Res> {
  _$HourCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dt = null,
    Object? main = null,
    Object? weather = null,
    Object? wind = null,
    Object? dtTxt = null,
  }) {
    return _then(_value.copyWith(
      dt: null == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int,
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as Main,
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<Weather>,
      wind: null == wind
          ? _value.wind
          : wind // ignore: cast_nullable_to_non_nullable
              as Wind,
      dtTxt: null == dtTxt
          ? _value.dtTxt
          : dtTxt // ignore: cast_nullable_to_non_nullable
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
}

/// @nodoc
abstract class _$$HourImplCopyWith<$Res> implements $HourCopyWith<$Res> {
  factory _$$HourImplCopyWith(
          _$HourImpl value, $Res Function(_$HourImpl) then) =
      __$$HourImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int dt,
      Main main,
      List<Weather> weather,
      Wind wind,
      @JsonKey(name: 'dt_txt') String dtTxt});

  @override
  $MainCopyWith<$Res> get main;
  @override
  $WindCopyWith<$Res> get wind;
}

/// @nodoc
class __$$HourImplCopyWithImpl<$Res>
    extends _$HourCopyWithImpl<$Res, _$HourImpl>
    implements _$$HourImplCopyWith<$Res> {
  __$$HourImplCopyWithImpl(_$HourImpl _value, $Res Function(_$HourImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dt = null,
    Object? main = null,
    Object? weather = null,
    Object? wind = null,
    Object? dtTxt = null,
  }) {
    return _then(_$HourImpl(
      dt: null == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int,
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as Main,
      weather: null == weather
          ? _value._weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<Weather>,
      wind: null == wind
          ? _value.wind
          : wind // ignore: cast_nullable_to_non_nullable
              as Wind,
      dtTxt: null == dtTxt
          ? _value.dtTxt
          : dtTxt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HourImpl implements _Hour {
  const _$HourImpl(
      {required this.dt,
      required this.main,
      required final List<Weather> weather,
      required this.wind,
      @JsonKey(name: 'dt_txt') required this.dtTxt})
      : _weather = weather;

  factory _$HourImpl.fromJson(Map<String, dynamic> json) =>
      _$$HourImplFromJson(json);

  @override
  final int dt;
  @override
  final Main main;
  final List<Weather> _weather;
  @override
  List<Weather> get weather {
    if (_weather is EqualUnmodifiableListView) return _weather;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weather);
  }

  @override
  final Wind wind;
  @override
  @JsonKey(name: 'dt_txt')
  final String dtTxt;

  @override
  String toString() {
    return 'Hour(dt: $dt, main: $main, weather: $weather, wind: $wind, dtTxt: $dtTxt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourImpl &&
            (identical(other.dt, dt) || other.dt == dt) &&
            (identical(other.main, main) || other.main == main) &&
            const DeepCollectionEquality().equals(other._weather, _weather) &&
            (identical(other.wind, wind) || other.wind == wind) &&
            (identical(other.dtTxt, dtTxt) || other.dtTxt == dtTxt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dt, main,
      const DeepCollectionEquality().hash(_weather), wind, dtTxt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HourImplCopyWith<_$HourImpl> get copyWith =>
      __$$HourImplCopyWithImpl<_$HourImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HourImplToJson(
      this,
    );
  }
}

abstract class _Hour implements Hour {
  const factory _Hour(
      {required final int dt,
      required final Main main,
      required final List<Weather> weather,
      required final Wind wind,
      @JsonKey(name: 'dt_txt') required final String dtTxt}) = _$HourImpl;

  factory _Hour.fromJson(Map<String, dynamic> json) = _$HourImpl.fromJson;

  @override
  int get dt;
  @override
  Main get main;
  @override
  List<Weather> get weather;
  @override
  Wind get wind;
  @override
  @JsonKey(name: 'dt_txt')
  String get dtTxt;
  @override
  @JsonKey(ignore: true)
  _$$HourImplCopyWith<_$HourImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
