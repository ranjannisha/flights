import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight/src/core/errors/app_exception.dart';
import 'package:flight/src/core/helpers/storage_helper.dart';
import 'package:flight/src/core/services/api/api_endpoints.dart';
import 'package:flight/src/core/services/response/api_response.dart';
import 'package:flight/src/features/authentication/data/models/request/login_request_params.dart';
import 'package:flight/src/features/authentication/data/models/response/login_response_model.dart';
import 'package:injectable/injectable.dart';

abstract class LoginRemoteDataSource {
  /// Makes a login request to the API and returns the response.
  ///
  /// Throws [AppException] if an error occurs during the login process.
  Future<ApiResponse<LoginResponseModel>> login({
    required LoginRequestParams loginParams,
  });

  Future<ApiResponse<LoginResponseModel>> signUp({
    required LoginRequestParams loginParams,
  });

}

@LazySingleton(as: LoginRemoteDataSource)
class LoginRemoteSourceImpl implements LoginRemoteDataSource {
  LoginRemoteSourceImpl(@Named('authenticated') Dio dio, this._storageHelper)
    : _dio = dio;

  final Dio _dio;
  final StorageHelper _storageHelper;

  // @override
  // Future<ApiResponse<LoginResponseModel>> login(
  //     {required LoginRequestParams loginParams}) async {
  //   try {
  //     final response = await _dio.post(
  //       ApiEndPoints.login,
  //       data: {'username': loginParams.email, 'password': loginParams.password},
  //     );
  //     if (response.statusCode == 200) {
  //
  //       if (loginParams.rememberMe) {
  //         _storageHelper.setRememberMeLogin('true');
  //         _storageHelper.setRememberMeUserName(loginParams.email);
  //       } else {
  //         _storageHelper.setRememberMeLogin('false');
  //         _storageHelper.setRememberMeUserName('');
  //       }
  //
  //       return ApiResponse(
  //         data: LoginResponseModel.fromJson(
  //             response.data as Map<String, dynamic>),
  //         message: response.data['message'] as String,
  //         success: response.data['success'] as bool,
  //       );
  //     } else {
  //       throw const AppException(message: 'Unknown Error');
  //     }
  //   } on DioException catch (e) {
  //     throw AppException.fromDioError(e);
  //   }
  // }
  @override
  Future<ApiResponse<LoginResponseModel>> login({
    required LoginRequestParams loginParams,
  }) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: loginParams.email,
            password: loginParams.password,
          );

      final user = userCredential.user;
      if (user == null) {
        throw const AppException(message: 'User not found');
      }

      // Save remember me preferences
      if (loginParams.rememberMe) {
        _storageHelper.setRememberMeLogin('true');
        _storageHelper.setRememberMeUserName(loginParams.email);
      } else {
        _storageHelper.setRememberMeLogin('false');
        _storageHelper.setRememberMeUserName('');
      }

      return ApiResponse(
        data: LoginResponseModel(uid: user.uid, email: user.email ?? ''),
        message: 'Login successful',
        success: true,
      );
    } on FirebaseAuthException catch (e) {
      throw AppException(message: e.message ?? 'Login failed');
    } catch (e) {
      throw const AppException(message: 'Unknown error');
    }
  }

  Future<ApiResponse<LoginResponseModel>> signUp({
    required LoginRequestParams loginParams,
  }) async {
    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: loginParams.email,
        password: loginParams.password,
      );

      final user = userCredential.user;
      if (user == null) {
        throw const AppException(message: 'User creation failed');
      }

      if (loginParams.rememberMe) {
        _storageHelper.setRememberMeLogin('true');
        _storageHelper.setRememberMeUserName(loginParams.email);
      } else {
        _storageHelper.setRememberMeLogin('false');
        _storageHelper.setRememberMeUserName('');
      }

      return ApiResponse(
        data: LoginResponseModel(
          uid: user.uid,
          email: user.email ?? '',
        ),
        message: 'Account created successfully',
        success: true,
      );
    } on FirebaseAuthException catch (e) {
      throw AppException(message: e.message ?? 'Sign-up failed');
    } catch (e) {
      throw const AppException(message: 'Unknown error during sign-up');
    }
  }
}
