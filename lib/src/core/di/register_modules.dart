import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flight/src/app/app.dart';
import 'package:flight/src/core/extensions/num_extensions.dart';
import 'package:flight/src/core/helpers/storage_helper.dart';
import 'package:flight/src/core/routes/app_router.dart';
import 'package:flight/src/core/services/network/custom_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  AppRouter get router => AppRouter();

  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  FlutterSecureStorage get storage => const FlutterSecureStorage(
        iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
        aOptions: AndroidOptions(
          encryptedSharedPreferences: true,
        ),
      );

  @lazySingleton
  StorageHelper get storageHelper => StorageHelper(storage);

  @Named('authenticated')
  @lazySingleton
  Dio get authenticatedDio {
    return Dio(
      BaseOptions(
        baseUrl: dotenv.env['BASE_URL']!,
        receiveTimeout: 60000.milliSeconds,
        connectTimeout: 60000.milliSeconds,
        responseType: ResponseType.json,
        headers: <String, dynamic>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        persistentConnection: true,
      ),
    )
      ..interceptors.addAll([
        if (kDebugMode)
          TalkerDioLogger(
            talker: talker,
            addonId: 'PayNow-wallet',
            settings: TalkerDioLoggerSettings(
              printRequestHeaders: true,
              printResponseHeaders: true,
              printResponseMessage: true,
              errorPen: AnsiPen()..red(),
              printRequestData: true,
              printResponseData: true,
              responsePen: AnsiPen()..green(),
            ),
          ),
        CustomInterceptors()
      ])
      ..httpClientAdapter = CustomHttpClientAdapter();
  }
}

class CustomHttpClientAdapter extends IOHttpClientAdapter {
  @override
  OnHttpClientCreate? onHttpClientCreate = (client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };
}
