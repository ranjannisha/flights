part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _Initial;

  const factory DashboardState.loading() = _Loading;

  const factory DashboardState.noInternet() = _NoInternet;

  const factory DashboardState.error({ String? message}) =
  _Error;

  const factory DashboardState.success(
      {required ApiResponse<DashboardResponseModel> dashboardResponse}) = _Success;
}