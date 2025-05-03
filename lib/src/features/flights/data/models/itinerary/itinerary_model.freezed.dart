// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'itinerary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItineraryModel _$ItineraryModelFromJson(Map<String, dynamic> json) {
  return _ItineraryModel.fromJson(json);
}

/// @nodoc
mixin _$ItineraryModel {
  String get id => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get agent => throw _privateConstructorUsedError;
  @JsonKey(name: 'agent_rating')
  double get agentRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'legs')
  List<String> get legIds => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  List<LegModel> get legs => throw _privateConstructorUsedError;

  /// Serializes this ItineraryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItineraryModelCopyWith<ItineraryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItineraryModelCopyWith<$Res> {
  factory $ItineraryModelCopyWith(
          ItineraryModel value, $Res Function(ItineraryModel) then) =
      _$ItineraryModelCopyWithImpl<$Res, ItineraryModel>;
  @useResult
  $Res call(
      {String id,
      String price,
      String agent,
      @JsonKey(name: 'agent_rating') double agentRating,
      @JsonKey(name: 'legs') List<String> legIds,
      @JsonKey(ignore: true) List<LegModel> legs});
}

/// @nodoc
class _$ItineraryModelCopyWithImpl<$Res, $Val extends ItineraryModel>
    implements $ItineraryModelCopyWith<$Res> {
  _$ItineraryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? agent = null,
    Object? agentRating = null,
    Object? legIds = null,
    Object? legs = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      agent: null == agent
          ? _value.agent
          : agent // ignore: cast_nullable_to_non_nullable
              as String,
      agentRating: null == agentRating
          ? _value.agentRating
          : agentRating // ignore: cast_nullable_to_non_nullable
              as double,
      legIds: null == legIds
          ? _value.legIds
          : legIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      legs: null == legs
          ? _value.legs
          : legs // ignore: cast_nullable_to_non_nullable
              as List<LegModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItineraryModelImplCopyWith<$Res>
    implements $ItineraryModelCopyWith<$Res> {
  factory _$$ItineraryModelImplCopyWith(_$ItineraryModelImpl value,
          $Res Function(_$ItineraryModelImpl) then) =
      __$$ItineraryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String price,
      String agent,
      @JsonKey(name: 'agent_rating') double agentRating,
      @JsonKey(name: 'legs') List<String> legIds,
      @JsonKey(ignore: true) List<LegModel> legs});
}

/// @nodoc
class __$$ItineraryModelImplCopyWithImpl<$Res>
    extends _$ItineraryModelCopyWithImpl<$Res, _$ItineraryModelImpl>
    implements _$$ItineraryModelImplCopyWith<$Res> {
  __$$ItineraryModelImplCopyWithImpl(
      _$ItineraryModelImpl _value, $Res Function(_$ItineraryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? agent = null,
    Object? agentRating = null,
    Object? legIds = null,
    Object? legs = null,
  }) {
    return _then(_$ItineraryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      agent: null == agent
          ? _value.agent
          : agent // ignore: cast_nullable_to_non_nullable
              as String,
      agentRating: null == agentRating
          ? _value.agentRating
          : agentRating // ignore: cast_nullable_to_non_nullable
              as double,
      legIds: null == legIds
          ? _value._legIds
          : legIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      legs: null == legs
          ? _value._legs
          : legs // ignore: cast_nullable_to_non_nullable
              as List<LegModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItineraryModelImpl implements _ItineraryModel {
  const _$ItineraryModelImpl(
      {required this.id,
      required this.price,
      required this.agent,
      @JsonKey(name: 'agent_rating') required this.agentRating,
      @JsonKey(name: 'legs') required final List<String> legIds,
      @JsonKey(ignore: true) final List<LegModel> legs = const []})
      : _legIds = legIds,
        _legs = legs;

  factory _$ItineraryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItineraryModelImplFromJson(json);

  @override
  final String id;
  @override
  final String price;
  @override
  final String agent;
  @override
  @JsonKey(name: 'agent_rating')
  final double agentRating;
  final List<String> _legIds;
  @override
  @JsonKey(name: 'legs')
  List<String> get legIds {
    if (_legIds is EqualUnmodifiableListView) return _legIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_legIds);
  }

  final List<LegModel> _legs;
  @override
  @JsonKey(ignore: true)
  List<LegModel> get legs {
    if (_legs is EqualUnmodifiableListView) return _legs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_legs);
  }

  @override
  String toString() {
    return 'ItineraryModel(id: $id, price: $price, agent: $agent, agentRating: $agentRating, legIds: $legIds, legs: $legs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItineraryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.agent, agent) || other.agent == agent) &&
            (identical(other.agentRating, agentRating) ||
                other.agentRating == agentRating) &&
            const DeepCollectionEquality().equals(other._legIds, _legIds) &&
            const DeepCollectionEquality().equals(other._legs, _legs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      price,
      agent,
      agentRating,
      const DeepCollectionEquality().hash(_legIds),
      const DeepCollectionEquality().hash(_legs));

  /// Create a copy of ItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItineraryModelImplCopyWith<_$ItineraryModelImpl> get copyWith =>
      __$$ItineraryModelImplCopyWithImpl<_$ItineraryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItineraryModelImplToJson(
      this,
    );
  }
}

abstract class _ItineraryModel implements ItineraryModel {
  const factory _ItineraryModel(
      {required final String id,
      required final String price,
      required final String agent,
      @JsonKey(name: 'agent_rating') required final double agentRating,
      @JsonKey(name: 'legs') required final List<String> legIds,
      @JsonKey(ignore: true) final List<LegModel> legs}) = _$ItineraryModelImpl;

  factory _ItineraryModel.fromJson(Map<String, dynamic> json) =
      _$ItineraryModelImpl.fromJson;

  @override
  String get id;
  @override
  String get price;
  @override
  String get agent;
  @override
  @JsonKey(name: 'agent_rating')
  double get agentRating;
  @override
  @JsonKey(name: 'legs')
  List<String> get legIds;
  @override
  @JsonKey(ignore: true)
  List<LegModel> get legs;

  /// Create a copy of ItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItineraryModelImplCopyWith<_$ItineraryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
