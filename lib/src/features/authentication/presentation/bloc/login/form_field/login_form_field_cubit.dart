import 'package:bloc/bloc.dart';
import 'package:flight/src/app/app.dart';
import 'package:flight/src/core/extensions/string_extension.dart';
import 'package:flight/src/core/validation/form_field.dart';
import 'package:flight/src/features/authentication/domain/entities/auth/form_data_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flight/l10n/l10n.dart';

part 'login_form_field_state.dart';

part 'login_form_field_cubit.freezed.dart';

@injectable
class LoginFormFieldCubit extends Cubit<LoginFormFieldState> {
  LoginFormFieldCubit() : super(LoginFormFieldState(FormDataEntity.empty()));

  void onUserNameChanged(String userName) {
    final l10n = scaffoldKey.currentContext?.l10n;
    final _state = state.loginFormEntity.copyUserName(userName.trim());
    late FormField userNameField;
    if (userName.isEmpty) {
      userNameField = _state.userName
          .copyWith(isValid: false, errorMessage: l10n!.enterValidUserName);
    } else {
      if (!userName.isUserName) {
        userNameField = _state.userName
            .copyWith(isValid: false, errorMessage: l10n!.enterValidUserName);
      } else {
        userNameField =
            _state.userName.copyWith(isValid: true, errorMessage: '');
      }
    }
    emit(LoginFormFieldState(_state.copyWith(userName: userNameField)));
  }

  void onPasswordChanged(String password) {
    final l10n = scaffoldKey.currentContext?.l10n;
    final _state = state.loginFormEntity.copyPassword(password.trim());
    late FormField passwordField;
    if (password.isEmpty) {
      passwordField = _state.password
          .copyWith(isValid: false, errorMessage: l10n!.enterValidPassword);
    } else {
      if (!password.isPassword) {
        passwordField = _state.password
            .copyWith(isValid: false, errorMessage: l10n!.enterValidPassword);
      } else {
        passwordField =
            _state.password.copyWith(isValid: true, errorMessage: '');
      }
    }
    emit(LoginFormFieldState(_state.copyWith(password: passwordField)));
  }

  void obscureText() {
    final _state = state.loginFormEntity;
    final password =
        _state.password.copyWith(obscureText: !_state.password.obscureText);
    emit(LoginFormFieldState(_state.copyWith(password: password)));
  }

  void setError(String error) {
    final _state = state.loginFormEntity;
    _state.error = error;
    emit(LoginFormFieldState(_state));
  }

  void setUserNameTouched() {
    final _state = state.loginFormEntity;
    _state.error = '';
    final _userName = _state.userName.copyWith(isTouched: true);
    emit(LoginFormFieldState(_state.copyWith(userName: _userName)));
  }

  void setPasswordTouched() {
    final _state = state.loginFormEntity;
    _state.error = '';

    emit(LoginFormFieldState(
        _state.copyWith(password: _state.password.copyWith(isTouched: true))));
  }

  void setPasswordObscure({required bool isObscure}) {
    final _state = state.loginFormEntity;
    emit(LoginFormFieldState(
        _state.copyWith(password: _state.password.copyWith(isTouched: true))));
  }
}
