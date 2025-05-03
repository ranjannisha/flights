import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flight/src/features/flights/data/models/itinerary/itinerary_model.dart';
import 'package:flight/src/features/flights/domain/usecase/flight_use_case.dart';

part 'flight_state.dart';
part 'flight_cubit.freezed.dart';

@injectable
class FlightCubit extends Cubit<FlightState> {
  FlightCubit(this._useCase) : super(const FlightState.initial());

  final FlightUseCase _useCase;

  Future<void> loadFlights({String? filter}) async {
    emit(const FlightState.loading());

    final result = await _useCase.execute(filter);

    result.fold(
          (error) => error.when(
        serverError: (msg) => emit(FlightState.error(message: msg)),
        noInternet: () => emit(const FlightState.noInternet()),
      ),
          (itineraries) => emit(FlightState.success(
        itineraries: itineraries,
        selectedFilter: filter,
      )),
    );
  }
}
