import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flight/src/core/services/response/api_response.dart';
import 'package:flight/src/features/dashboard/data/models/dashboard_response_model.dart';
import 'package:flight/src/features/dashboard/domain/usecases/dashboard_usecase.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

@injectable
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(this._useCase) : super(const DashboardState.initial());

  final DashboardUseCase _useCase;

  void getDashboardData() async {
    emit(const DashboardState.loading());
    emit((await _useCase.execute(null)).fold(
            (error) => error.when(
            serverError: (serverError) =>
                DashboardState.error(message: serverError),
            noInternet: () => const DashboardState.noInternet()),
            (data) => DashboardState.success(dashboardResponse: data)));
  }
}