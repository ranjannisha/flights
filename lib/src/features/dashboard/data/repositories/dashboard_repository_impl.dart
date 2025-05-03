import 'package:dartz/dartz.dart';
import 'package:flight/src/core/errors/app_error.dart';
import 'package:flight/src/core/errors/app_exception.dart';
import 'package:flight/src/core/internet/internet_info.dart';
import 'package:flight/src/core/services/response/api_response.dart';
import 'package:injectable/injectable.dart';
import 'package:flight/src/features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:flight/src/features/dashboard/data/models/dashboard_response_model.dart';
import 'package:flight/src/features/dashboard/domain/repositories/dashboard_repository.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImp implements DashboardRepository {
  DashboardRepositoryImp(this._dashboardRemoteSource, this._internetInfo);
  final DashboardRemoteDataSource _dashboardRemoteSource;
  final InternetInfo _internetInfo;

  @override
  Future<Either<AppError, ApiResponse<DashboardResponseModel>>> dashboard() async {
    if (await _internetInfo.isConnected) {
      try {
        final response =
        await _dashboardRemoteSource.dashboard();
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
