// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airline_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AirlineModel _$AirlineModelFromJson(Map<String, dynamic> json) {
  return _AirlineModel.fromJson(json);
}

/// @nodoc
mixin _$AirlineModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get flightCount => throw _privateConstructorUsedError;

  /// Serializes this AirlineModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AirlineModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AirlineModelCopyWith<AirlineModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AirlineModelCopyWith<$Res> {
  factory $AirlineModelCopyWith(
          AirlineModel value, $Res Function(AirlineModel) then) =
      _$AirlineModelCopyWithImpl<$Res, AirlineModel>;
  @useResult
  $Res call({String id, String name, int flightCount});
}

/// @nodoc
class _$AirlineModelCopyWithImpl<$Res, $Val extends AirlineModel>
    implements $AirlineModelCopyWith<$Res> {
  _$AirlineModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AirlineModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? flightCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      flightCount: null == flightCount
          ? _value.flightCount
          : flightCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AirlineModelImplCopyWith<$Res>
    implements $AirlineModelCopyWith<$Res> {
  factory _$$AirlineModelImplCopyWith(
          _$AirlineModelImpl value, $Res Function(_$AirlineModelImpl) then) =
      __$$AirlineModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, int flightCount});
}

/// @nodoc
class __$$AirlineModelImplCopyWithImpl<$Res>
    extends _$AirlineModelCopyWithImpl<$Res, _$AirlineModelImpl>
    implements _$$AirlineModelImplCopyWith<$Res> {
  __$$AirlineModelImplCopyWithImpl(
      _$AirlineModelImpl _value, $Res Function(_$AirlineModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AirlineModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? flightCount = null,
  }) {
    return _then(_$AirlineModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      flightCount: null == flightCount
          ? _value.flightCount
          : flightCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AirlineModelImpl implements _AirlineModel {
  const _$AirlineModelImpl(
      {required this.id, required this.name, this.flightCount = 0});

  factory _$AirlineModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AirlineModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey()
  final int flightCount;

  @override
  String toString() {
    return 'AirlineModel(id: $id, name: $name, flightCount: $flightCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AirlineModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.flightCount, flightCount) ||
                other.flightCount == flightCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, flightCount);

  /// Create a copy of AirlineModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AirlineModelImplCopyWith<_$AirlineModelImpl> get copyWith =>
      __$$AirlineModelImplCopyWithImpl<_$AirlineModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AirlineModelImplToJson(
      this,
    );
  }
}

abstract class _AirlineModel implements AirlineModel {
  const factory _AirlineModel(
      {required final String id,
      required final String name,
      final int flightCount}) = _$AirlineModelImpl;

  factory _AirlineModel.fromJson(Map<String, dynamic> json) =
      _$AirlineModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get flightCount;

  /// Create a copy of AirlineModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AirlineModelImplCopyWith<_$AirlineModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
