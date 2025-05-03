import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flight/l10n/l10n.dart';
import 'package:flight/src/core/di/injection.dart';
import 'package:flight/src/core/routes/app_router.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_exception.freezed.dart';
part 'app_exception.g.dart';

@freezed
class AppException extends FormatException with _$AppException {
  const AppException._();

  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory AppException({
    required String message,
    int? statusCode,
    Map<String, dynamic>? errors,
  }) = _AppException;

  factory AppException.fromJson(Map<String, dynamic> json) =>
      _$AppExceptionFromJson(json);

  factory AppException.fromDioError(DioException e) {
    final context = getIt<AppRouter>().navigatorKey.currentContext;
    final l10n = context!.l10n;

    try {
      if (e is SocketException) {
        return AppException(message: l10n.noInternetConnection);
      }
      if (e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        return AppException(message: l10n.error);
      }

      if (e.response != null) {
        if (e.response!.statusCode == 500) {
          return AppException(message: l10n.error);
        } else if (e.response!.statusCode == 502) {
          return AppException(message: l10n.error);
        } else if (e.response!.statusCode == 404) {
          return AppException(message: l10n.error);
        } else {
          final message = e.response?.data?['message'] ?? e.message ?? e.error;
          return AppException(
            message: '$message',
            statusCode: e.response?.statusCode,
          );
        }
      } else if (e.message != null) {
        return AppException(message: e.message as String);
      } else {
        if (e.error is SocketException) {
          return AppException(message: l10n.error);
        } else {
          return AppException(message: e.error.toString());
        }
      }
    } on FormatException {
      return AppException(message: l10n.formatException);
    }
  }
}
