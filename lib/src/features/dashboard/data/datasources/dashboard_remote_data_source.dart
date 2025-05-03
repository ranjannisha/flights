import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flight/src/core/errors/app_exception.dart';
import 'package:flight/src/core/helpers/storage_helper.dart';
import 'package:flight/src/core/services/response/api_response.dart';
import 'package:injectable/injectable.dart';
import 'package:flight/src/features/dashboard/data/models/dashboard_response_model.dart';

abstract class DashboardRemoteDataSource {
  Future<ApiResponse<DashboardResponseModel>> dashboard();
}

@LazySingleton(as: DashboardRemoteDataSource)
class DashboardRemoteSourceImpl implements DashboardRemoteDataSource {
  DashboardRemoteSourceImpl(@Named('authenticated') Dio dio, this._storageHelper)
      : _dio = dio;

  final Dio _dio;
  final StorageHelper _storageHelper;

  @override
  Future<ApiResponse<DashboardResponseModel>> dashboard() async {
    try {
      final jsonString = await rootBundle.loadString('assets/json/dashboard.json');
      final jsonData = json.decode(jsonString);

      return ApiResponse(
        data: DashboardResponseModel.fromJson(jsonData),
        message: jsonData['message'] as String? ?? 'Success',
        success: jsonData['success'] as bool? ?? true,
      );
    }
    on DioException catch (e) {
      throw AppException.fromDioError(e);
    }
  }
}
