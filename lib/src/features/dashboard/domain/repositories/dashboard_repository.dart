import 'package:dartz/dartz.dart';
import 'package:flight/src/core/errors/app_error.dart';
import 'package:flight/src/core/services/response/api_response.dart';
import 'package:flight/src/features/dashboard/data/models/dashboard_response_model.dart';

abstract class DashboardRepository {

  Future<Either<AppError, ApiResponse<DashboardResponseModel>>> dashboard();
}
