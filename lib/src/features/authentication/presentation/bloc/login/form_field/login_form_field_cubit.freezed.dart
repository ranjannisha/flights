// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_form_field_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginFormFieldState {
  FormDataEntity get loginFormEntity => throw _privateConstructorUsedError;

  /// Create a copy of LoginFormFieldState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginFormFieldStateCopyWith<LoginFormFieldState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginFormFieldStateCopyWith<$Res> {
  factory $LoginFormFieldStateCopyWith(
          LoginFormFieldState value, $Res Function(LoginFormFieldState) then) =
      _$LoginFormFieldStateCopyWithImpl<$Res, LoginFormFieldState>;
  @useResult
  $Res call({FormDataEntity loginFormEntity});
}

/// @nodoc
class _$LoginFormFieldStateCopyWithImpl<$Res, $Val extends LoginFormFieldState>
    implements $LoginFormFieldStateCopyWith<$Res> {
  _$LoginFormFieldStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginFormFieldState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginFormEntity = null,
  }) {
    return _then(_value.copyWith(
      loginFormEntity: null == loginFormEntity
          ? _value.loginFormEntity
          : loginFormEntity // ignore: cast_nullable_to_non_nullable
              as FormDataEntity,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginFormFieldStateImplCopyWith<$Res>
    implements $LoginFormFieldStateCopyWith<$Res> {
  factory _$$LoginFormFieldStateImplCopyWith(_$LoginFormFieldStateImpl value,
          $Res Function(_$LoginFormFieldStateImpl) then) =
      __$$LoginFormFieldStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FormDataEntity loginFormEntity});
}

/// @nodoc
class __$$LoginFormFieldStateImplCopyWithImpl<$Res>
    extends _$LoginFormFieldStateCopyWithImpl<$Res, _$LoginFormFieldStateImpl>
    implements _$$LoginFormFieldStateImplCopyWith<$Res> {
  __$$LoginFormFieldStateImplCopyWithImpl(_$LoginFormFieldStateImpl _value,
      $Res Function(_$LoginFormFieldStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginFormFieldState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginFormEntity = null,
  }) {
    return _then(_$LoginFormFieldStateImpl(
      null == loginFormEntity
          ? _value.loginFormEntity
          : loginFormEntity // ignore: cast_nullable_to_non_nullable
              as FormDataEntity,
    ));
  }
}

/// @nodoc

class _$LoginFormFieldStateImpl implements _LoginFormFieldState {
  const _$LoginFormFieldStateImpl(this.loginFormEntity);

  @override
  final FormDataEntity loginFormEntity;

  @override
  String toString() {
    return 'LoginFormFieldState(loginFormEntity: $loginFormEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginFormFieldStateImpl &&
            (identical(other.loginFormEntity, loginFormEntity) ||
                other.loginFormEntity == loginFormEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginFormEntity);

  /// Create a copy of LoginFormFieldState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginFormFieldStateImplCopyWith<_$LoginFormFieldStateImpl> get copyWith =>
      __$$LoginFormFieldStateImplCopyWithImpl<_$LoginFormFieldStateImpl>(
          this, _$identity);
}

abstract class _LoginFormFieldState implements LoginFormFieldState {
  const factory _LoginFormFieldState(final FormDataEntity loginFormEntity) =
      _$LoginFormFieldStateImpl;

  @override
  FormDataEntity get loginFormEntity;

  /// Create a copy of LoginFormFieldState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginFormFieldStateImplCopyWith<_$LoginFormFieldStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
