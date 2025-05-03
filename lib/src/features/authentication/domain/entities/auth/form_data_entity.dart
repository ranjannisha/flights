import 'package:flight/src/core/validation/form_field.dart';

class FormDataEntity {
  FormDataEntity.empty()
      : this(
            password: const FormField(value: '', obscureText: true),
            userName: const FormField(value: ''));

  FormDataEntity({
    required this.password,
    required this.userName,
  });

  final FormField password;
  final FormField userName;
  String _error = '';
  set error(String value) => _error = value;
  String get error => _error;
  bool get isLoginFormValid => userName.isValid && password.isValid;
  FormDataEntity copyUserName(String value) => FormDataEntity(
      password: password, userName: userName.copyWith(value: value));
  FormDataEntity copyPassword(String passwordText) => FormDataEntity(
      password: password.copyWith(value: passwordText), userName: userName);

  FormDataEntity copyWith({FormField? password, FormField? userName}) =>
      FormDataEntity(
          password: password ?? this.password,
          userName: userName ?? this.userName);
}
