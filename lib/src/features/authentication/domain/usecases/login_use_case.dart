import 'package:dartz/dartz.dart';
import 'package:flight/src/core/errors/app_error.dart';
import 'package:flight/src/core/services/response/api_response.dart';
import 'package:flight/src/core/usecase/base_use_case.dart';
import 'package:flight/src/features/authentication/data/models/request/login_request_params.dart';
import 'package:flight/src/features/authentication/data/models/response/login_response_model.dart';
import 'package:flight/src/features/authentication/domain/repositories/login_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginUseCase
    implements
        BaseUseCase<LoginRequestParams, ApiResponse<LoginResponseModel>> {
  final LoginRepository _loginRepository;
  LoginUseCase(this._loginRepository);
  
  /// Executes the login use case with the provided parameters.
  ///
  /// Returns the result of the login operation as ApiResponse
  @override
  Future<Either<AppError, ApiResponse<LoginResponseModel>>> execute(
          LoginRequestParams param) =>
      _loginRepository.login(loginParams: param);
}
