
import 'package:equatable/equatable.dart';

class LoginRequestParams extends Equatable{
  final String email;
  final String password;
  final bool rememberMe;
  const LoginRequestParams({
    required this.email,
    required this.password,
    this.rememberMe = false
  });

  @override
  List<Object?> get props => [email, password, rememberMe];
}
