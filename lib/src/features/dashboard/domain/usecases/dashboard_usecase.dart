import 'package:dartz/dartz.dart';
import 'package:flight/src/core/errors/app_error.dart';
import 'package:flight/src/core/services/response/api_response.dart';
import 'package:flight/src/core/usecase/base_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:flight/src/features/dashboard/data/models/dashboard_response_model.dart';
import 'package:flight/src/features/dashboard/domain/repositories/dashboard_repository.dart';

@lazySingleton
class DashboardUseCase
    implements
        BaseUseCase<void, ApiResponse<DashboardResponseModel>> {
  final DashboardRepository _dashboardRepository;
  DashboardUseCase(this._dashboardRepository);

  @override
  Future<Either<AppError, ApiResponse<DashboardResponseModel>>> execute(_) =>
      _dashboardRepository.dashboard();
}
