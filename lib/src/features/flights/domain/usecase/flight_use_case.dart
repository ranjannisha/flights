import 'package:dartz/dartz.dart';
import 'package:flight/src/core/errors/app_error.dart';
import 'package:flight/src/core/usecase/base_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:flight/src/features/flights/data/models/itinerary/itinerary_model.dart';
import 'package:flight/src/features/flights/domain/repositories/flight_repository.dart';

@lazySingleton
class FlightUseCase implements BaseUseCase<String?, List<ItineraryModel>> {
  final FlightRepository _flightRepository;

  FlightUseCase(this._flightRepository);

  @override
  Future<Either<AppError, List<ItineraryModel>>> execute(String? filter) {
    return _flightRepository.fetchAndStoreFlights(filter: filter);
  }
}
