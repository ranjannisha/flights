import 'package:dartz/dartz.dart';
import 'package:flight/src/core/errors/app_error.dart';
import 'package:flight/src/core/errors/app_exception.dart';
import 'package:flight/src/core/internet/internet_info.dart';
import 'package:injectable/injectable.dart';
import 'package:flight/src/features/flights/data/datasources/flight_remote_data_source.dart';
import 'package:flight/src/features/flights/data/models/airline/airline_model.dart';
import 'package:flight/src/features/flights/data/models/itinerary/itinerary_model.dart';
import 'package:flight/src/features/flights/domain/repositories/flight_repository.dart';

@LazySingleton(as: FlightRepository)
class FlightRepositoryImp implements FlightRepository {
  FlightRepositoryImp(this._flightRemoteSource, this._internetInfo);
  final FlightRemoteDataSource _flightRemoteSource;
  final InternetInfo _internetInfo;

  @override
  Future<Either<AppError, List<ItineraryModel>>> fetchAndStoreFlights({String? filter}) async {
    if (await _internetInfo.isConnected) {
      try {
        final result = await _flightRemoteSource.fetchAndStoreFlights(filter: filter);
        return right(result);
      } on AppException catch (e) {
        return left(AppError.serverError(message: e.message));
      }
    } else {
      return left(const AppError.noInternet());
    }
  }

  Future<Either<AppError, List<AirlineModel>>> fetchAndStoreAirlines({String? filter}) async {
    if (await _internetInfo.isConnected) {
      try {
        final result = await _flightRemoteSource.fetchAirlines(filter: filter);
        return right(result);
      } on AppException catch (e) {
        return left(AppError.serverError(message: e.message));
      }
    } else {
      return left(const AppError.noInternet());
    }
  }
}
