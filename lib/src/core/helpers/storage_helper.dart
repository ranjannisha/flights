import 'dart:async';
import 'package:flight/src/core/constants/app_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageHelper {
  const StorageHelper(this._storage);

  final FlutterSecureStorage _storage;

  FutureOr<String?> get getRememberMe async =>
      await _storage.read(key: AppConstants.rememberMe);

  Future<void> setRememberMeLogin(String value) async =>
      await _storage.write(key: AppConstants.rememberMe, value: value);

  FutureOr<String?> get getRememberMeUserName async =>
      await _storage.read(key: AppConstants.rememberMeUserName);

  Future<void> setRememberMeUserName(String value) async =>
      await _storage.write(key: AppConstants.rememberMeUserName, value: value);

  Future<void> clearAll() async => _storage.deleteAll();

  Future<Map<String, String>> getAllValues() async => _storage.readAll();

  FutureOr<String?> get getUserName async =>
      await _storage.read(key: AppConstants.userName);
}
