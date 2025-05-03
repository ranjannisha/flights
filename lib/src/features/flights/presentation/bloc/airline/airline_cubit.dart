import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flight/src/features/flights/data/models/airline/airline_model.dart';
import 'package:flight/src/features/flights/data/models/leg/leg_model.dart';
import 'package:flight/src/features/flights/domain/usecase/airline_use_case.dart';

part 'airline_state.dart';
part 'airline_cubit.freezed.dart';

@injectable

class AirlineCubit extends Cubit<AirlineState> {
  final AirlineUseCase _useCase;

  AirlineCubit(this._useCase) : super(const AirlineState.initial());

  Future<void> loadAirlines({String? filter}) async {
    emit(const AirlineState.loading());

    final result = await _useCase.execute(filter: filter);

    result.fold(
          (error) => error.when(
        serverError: (msg) => emit(AirlineState.error(message: msg)),
        noInternet: () => emit(const AirlineState.noInternet()),
      ),
          (airlines) => emit(AirlineState.success(
        airlines: airlines,
        allLegs: [],
        selectedAirlineFilter: filter,
      )),
    );
  }
}