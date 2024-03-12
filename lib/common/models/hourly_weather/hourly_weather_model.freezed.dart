// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hourly_weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HourlyWeatherModel _$HourlyWeatherModelFromJson(Map<String, dynamic> json) {
  return _HourlyWeatherModel.fromJson(json);
}

/// @nodoc
mixin _$HourlyWeatherModel {
  List<Hour> get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HourlyWeatherModelCopyWith<HourlyWeatherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourlyWeatherModelCopyWith<$Res> {
  factory $HourlyWeatherModelCopyWith(
          HourlyWeatherModel value, $Res Function(HourlyWeatherModel) then) =
      _$HourlyWeatherModelCopyWithImpl<$Res, HourlyWeatherModel>;
  @useResult
  $Res call({List<Hour> list});
}

/// @nodoc
class _$HourlyWeatherModelCopyWithImpl<$Res, $Val extends HourlyWeatherModel>
    implements $HourlyWeatherModelCopyWith<$Res> {
  _$HourlyWeatherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Hour>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HourlyWeatherModelImplCopyWith<$Res>
    implements $HourlyWeatherModelCopyWith<$Res> {
  factory _$$HourlyWeatherModelImplCopyWith(_$HourlyWeatherModelImpl value,
          $Res Function(_$HourlyWeatherModelImpl) then) =
      __$$HourlyWeatherModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Hour> list});
}

/// @nodoc
class __$$HourlyWeatherModelImplCopyWithImpl<$Res>
    extends _$HourlyWeatherModelCopyWithImpl<$Res, _$HourlyWeatherModelImpl>
    implements _$$HourlyWeatherModelImplCopyWith<$Res> {
  __$$HourlyWeatherModelImplCopyWithImpl(_$HourlyWeatherModelImpl _value,
      $Res Function(_$HourlyWeatherModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$HourlyWeatherModelImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Hour>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HourlyWeatherModelImpl implements _HourlyWeatherModel {
  const _$HourlyWeatherModelImpl({required final List<Hour> list})
      : _list = list;

  factory _$HourlyWeatherModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HourlyWeatherModelImplFromJson(json);

  final List<Hour> _list;
  @override
  List<Hour> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'HourlyWeatherModel(list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourlyWeatherModelImpl &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HourlyWeatherModelImplCopyWith<_$HourlyWeatherModelImpl> get copyWith =>
      __$$HourlyWeatherModelImplCopyWithImpl<_$HourlyWeatherModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HourlyWeatherModelImplToJson(
      this,
    );
  }
}

abstract class _HourlyWeatherModel implements HourlyWeatherModel {
  const factory _HourlyWeatherModel({required final List<Hour> list}) =
      _$HourlyWeatherModelImpl;

  factory _HourlyWeatherModel.fromJson(Map<String, dynamic> json) =
      _$HourlyWeatherModelImpl.fromJson;

  @override
  List<Hour> get list;
  @override
  @JsonKey(ignore: true)
  _$$HourlyWeatherModelImplCopyWith<_$HourlyWeatherModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
