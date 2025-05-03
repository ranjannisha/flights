import 'package:dartz/dartz.dart';
import 'package:flight/src/core/errors/app_error.dart';
import 'package:flight/src/core/errors/app_exception.dart';
import 'package:flight/src/core/internet/internet_info.dart';
import 'package:flight/src/core/services/response/api_response.dart';
import 'package:flight/src/features/authentication/data/datasources/login_remote_data_source.dart';
import 'package:flight/src/features/authentication/data/models/request/login_request_params.dart';
import 'package:flight/src/features/authentication/data/models/response/login_response_model.dart';
import 'package:flight/src/features/authentication/domain/repositories/login_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LoginRepository)
class LoginRepositoryImp implements LoginRepository {
  LoginRepositoryImp(this._authRemoteSource, this._internetInfo);
  final LoginRemoteDataSource _authRemoteSource;
  final InternetInfo _internetInfo;

  @override
  Future<Either<AppError, ApiResponse<LoginResponseModel>>> login(
      {required LoginRequestParams loginParams}) async {
    if (await _internetInfo.isConnected) {
      try {
        final response =
            await _authRemoteSource.login(loginParams: loginParams);
        ;
        return right(response);
      } on AppException catch (e) {
        return left(AppError.serverError(message: e.message));
      }
    } else {
      return left(const AppError.noInternet());
    }
  }

  @override
  Future<Either<AppError, ApiResponse<LoginResponseModel>>> signUp(
      {required LoginRequestParams loginParams}) async {
    if (await _internetInfo.isConnected) {
      try {
        final response =
        await _authRemoteSource.signUp(loginParams: loginParams);
        ;
        return right(response);
      } on AppException catch (e) {
        return left(AppError.serverError(message: e.message));
      }
    } else {
      return left(const AppError.noInternet());
    }
  }
}
