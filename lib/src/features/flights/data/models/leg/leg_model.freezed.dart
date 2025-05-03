// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leg_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LegModel _$LegModelFromJson(Map<String, dynamic> json) {
  return _LegModel.fromJson(json);
}

/// @nodoc
mixin _$LegModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'departure_airport')
  String get departure => throw _privateConstructorUsedError;
  @JsonKey(name: 'arrival_airport')
  String get arrival => throw _privateConstructorUsedError;
  @JsonKey(name: 'stops')
  int get stops => throw _privateConstructorUsedError;
  @JsonKey(name: 'airline_id')
  String get airlineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'airline_name')
  String get airlineName => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_mins')
  int get duration => throw _privateConstructorUsedError;

  /// Serializes this LegModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LegModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LegModelCopyWith<LegModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LegModelCopyWith<$Res> {
  factory $LegModelCopyWith(LegModel value, $Res Function(LegModel) then) =
      _$LegModelCopyWithImpl<$Res, LegModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'departure_airport') String departure,
      @JsonKey(name: 'arrival_airport') String arrival,
      @JsonKey(name: 'stops') int stops,
      @JsonKey(name: 'airline_id') String airlineId,
      @JsonKey(name: 'airline_name') String airlineName,
      @JsonKey(name: 'duration_mins') int duration});
}

/// @nodoc
class _$LegModelCopyWithImpl<$Res, $Val extends LegModel>
    implements $LegModelCopyWith<$Res> {
  _$LegModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LegModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? departure = null,
    Object? arrival = null,
    Object? stops = null,
    Object? airlineId = null,
    Object? airlineName = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      departure: null == departure
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as String,
      arrival: null == arrival
          ? _value.arrival
          : arrival // ignore: cast_nullable_to_non_nullable
              as String,
      stops: null == stops
          ? _value.stops
          : stops // ignore: cast_nullable_to_non_nullable
              as int,
      airlineId: null == airlineId
          ? _value.airlineId
          : airlineId // ignore: cast_nullable_to_non_nullable
              as String,
      airlineName: null == airlineName
          ? _value.airlineName
          : airlineName // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LegModelImplCopyWith<$Res>
    implements $LegModelCopyWith<$Res> {
  factory _$$LegModelImplCopyWith(
          _$LegModelImpl value, $Res Function(_$LegModelImpl) then) =
      __$$LegModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'departure_airport') String departure,
      @JsonKey(name: 'arrival_airport') String arrival,
      @JsonKey(name: 'stops') int stops,
      @JsonKey(name: 'airline_id') String airlineId,
      @JsonKey(name: 'airline_name') String airlineName,
      @JsonKey(name: 'duration_mins') int duration});
}

/// @nodoc
class __$$LegModelImplCopyWithImpl<$Res>
    extends _$LegModelCopyWithImpl<$Res, _$LegModelImpl>
    implements _$$LegModelImplCopyWith<$Res> {
  __$$LegModelImplCopyWithImpl(
      _$LegModelImpl _value, $Res Function(_$LegModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LegModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? departure = null,
    Object? arrival = null,
    Object? stops = null,
    Object? airlineId = null,
    Object? airlineName = null,
    Object? duration = null,
  }) {
    return _then(_$LegModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      departure: null == departure
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as String,
      arrival: null == arrival
          ? _value.arrival
          : arrival // ignore: cast_nullable_to_non_nullable
              as String,
      stops: null == stops
          ? _value.stops
          : stops // ignore: cast_nullable_to_non_nullable
              as int,
      airlineId: null == airlineId
          ? _value.airlineId
          : airlineId // ignore: cast_nullable_to_non_nullable
              as String,
      airlineName: null == airlineName
          ? _value.airlineName
          : airlineName // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LegModelImpl implements _LegModel {
  const _$LegModelImpl(
      {required this.id,
      @JsonKey(name: 'departure_airport') required this.departure,
      @JsonKey(name: 'arrival_airport') required this.arrival,
      @JsonKey(name: 'stops') required this.stops,
      @JsonKey(name: 'airline_id') required this.airlineId,
      @JsonKey(name: 'airline_name') required this.airlineName,
      @JsonKey(name: 'duration_mins') required this.duration});

  factory _$LegModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LegModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'departure_airport')
  final String departure;
  @override
  @JsonKey(name: 'arrival_airport')
  final String arrival;
  @override
  @JsonKey(name: 'stops')
  final int stops;
  @override
  @JsonKey(name: 'airline_id')
  final String airlineId;
  @override
  @JsonKey(name: 'airline_name')
  final String airlineName;
  @override
  @JsonKey(name: 'duration_mins')
  final int duration;

  @override
  String toString() {
    return 'LegModel(id: $id, departure: $departure, arrival: $arrival, stops: $stops, airlineId: $airlineId, airlineName: $airlineName, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LegModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.departure, departure) ||
                other.departure == departure) &&
            (identical(other.arrival, arrival) || other.arrival == arrival) &&
            (identical(other.stops, stops) || other.stops == stops) &&
            (identical(other.airlineId, airlineId) ||
                other.airlineId == airlineId) &&
            (identical(other.airlineName, airlineName) ||
                other.airlineName == airlineName) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, departure, arrival, stops,
      airlineId, airlineName, duration);

  /// Create a copy of LegModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LegModelImplCopyWith<_$LegModelImpl> get copyWith =>
      __$$LegModelImplCopyWithImpl<_$LegModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LegModelImplToJson(
      this,
    );
  }
}

abstract class _LegModel implements LegModel {
  const factory _LegModel(
          {required final String id,
          @JsonKey(name: 'departure_airport') required final String departure,
          @JsonKey(name: 'arrival_airport') required final String arrival,
          @JsonKey(name: 'stops') required final int stops,
          @JsonKey(name: 'airline_id') required final String airlineId,
          @JsonKey(name: 'airline_name') required final String airlineName,
          @JsonKey(name: 'duration_mins') required final int duration}) =
      _$LegModelImpl;

  factory _LegModel.fromJson(Map<String, dynamic> json) =
      _$LegModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'departure_airport')
  String get departure;
  @override
  @JsonKey(name: 'arrival_airport')
  String get arrival;
  @override
  @JsonKey(name: 'stops')
  int get stops;
  @override
  @JsonKey(name: 'airline_id')
  String get airlineId;
  @override
  @JsonKey(name: 'airline_name')
  String get airlineName;
  @override
  @JsonKey(name: 'duration_mins')
  int get duration;

  /// Create a copy of LegModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LegModelImplCopyWith<_$LegModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
