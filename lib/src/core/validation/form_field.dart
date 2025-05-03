import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_field.freezed.dart';

@freezed
class FormField with _$FormField {
  const factory FormField({
    required String value,
    @Default('') String errorMessage,
    @Default(false) bool isValid,
    @Default(false) bool isTouched,
    @Default(false) bool obscureText,
  }) = _FormField;
}
