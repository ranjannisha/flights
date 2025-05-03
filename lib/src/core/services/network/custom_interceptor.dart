import 'package:dio/dio.dart';
import 'package:flight/src/core/di/injection.dart';
import 'package:flight/src/core/helpers/storage_helper.dart';
import 'package:flight/src/core/routes/app_router.dart';

/// A custom Dio Interceptor for handling requests and responses in an flight application.
///
/// This interceptor provides functionalities for handling errors, modifying request options,
/// and intercepting responses. It is primarily used for managing authentication tokens,
/// data serialization, and error handling across network requests.
class CustomInterceptors implements Interceptor {
  CustomInterceptors();

  final storageHelper = getIt<StorageHelper>();
  final router = getIt<AppRouter>();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response != null && err.response!.statusCode == 401) {
      try {} on DioException {
        return handler.next(err);
      }
    }

    return handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final data = options.data;
    options.data = {
      if (data != null) ...data as Map<String, dynamic>,
    };
    handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
