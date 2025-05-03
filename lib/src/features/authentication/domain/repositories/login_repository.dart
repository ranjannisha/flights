import 'package:dartz/dartz.dart';
import 'package:flight/src/core/errors/app_error.dart';
import 'package:flight/src/core/services/response/api_response.dart';
import 'package:flight/src/features/authentication/data/models/request/login_request_params.dart';
import 'package:flight/src/features/authentication/data/models/response/login_response_model.dart';

abstract class LoginRepository {
  /// Makes a login request and returns the response or an error.
  ///
  /// Throws [AppError] if an error occurs during the login process.
  Future<Either<AppError, ApiResponse<LoginResponseModel>>> login(
      {required LoginRequestParams loginParams});

  Future<Either<AppError, ApiResponse<LoginResponseModel>>> signUp(
      {required LoginRequestParams loginParams});
}
