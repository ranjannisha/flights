import 'package:dartz/dartz.dart';
import 'package:flight/src/core/errors/app_error.dart';
import 'package:injectable/injectable.dart';
import 'package:flight/src/features/flights/data/models/airline/airline_model.dart';
import 'package:flight/src/features/flights/domain/repositories/flight_repository.dart';

@lazySingleton
class AirlineUseCase {
  final FlightRepository _flightRepository;

  AirlineUseCase(this._flightRepository);

  Future<Either<AppError, List<AirlineModel>>> execute({String? filter}) {
    return _flightRepository.fetchAndStoreAirlines(filter: filter);
  }
}
