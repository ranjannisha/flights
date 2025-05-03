import 'package:dartz/dartz.dart';
import 'package:flight/src/core/errors/app_error.dart';
import 'package:flight/src/features/flights/data/models/airline/airline_model.dart';
import 'package:flight/src/features/flights/data/models/itinerary/itinerary_model.dart';

abstract class FlightRepository {

  Future<Either<AppError, List<ItineraryModel>>> fetchAndStoreFlights({String? filter});

  Future<Either<AppError, List<AirlineModel>>> fetchAndStoreAirlines({String? filter});
}
