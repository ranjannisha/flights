import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flight/src/core/helpers/storage_helper.dart';
import 'package:injectable/injectable.dart';
import 'package:flight/src/features/flights/data/models/airline/airline_model.dart';
import 'package:flight/src/features/flights/data/models/itinerary/itinerary_model.dart';
import 'package:flight/src/features/flights/data/models/leg/leg_model.dart';

abstract class FlightRemoteDataSource {
  Future<List<ItineraryModel>> fetchAndStoreFlights({String? filter});
  Future<List<AirlineModel>> fetchAirlines({String? filter});
}

@LazySingleton(as: FlightRemoteDataSource)
class FlightRemoteSourceImpl implements FlightRemoteDataSource {
  FlightRemoteSourceImpl(@Named('authenticated') Dio dio, this._storageHelper)
    : _dio = dio;

  final Dio _dio;
  final StorageHelper _storageHelper;

  @override
  Future<List<ItineraryModel>> fetchAndStoreFlights({String? filter}) async {
    const url =
        'https://raw.githubusercontent.com/Skyscanner/full-stack-recruitment-test/main/public/flights.json';

    final response = await Dio().get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to load flight data');
    }

    final Map<String, dynamic> data =
        response.data is String
            ? jsonDecode(response.data) as Map<String, dynamic>
            : response.data as Map<String, dynamic>;

    final legModels =
        (data['legs'] as List)
            .map((json) => LegModel.fromJson(json as Map<String, dynamic>))
            .toList();

    final itineraries =
        (data['itineraries'] as List).map((json) {
          final itinerary = ItineraryModel.fromJson(
            json as Map<String, dynamic>,
          );
          final legs =
              itinerary.legIds
                  .map((id) => legModels.firstWhere((leg) => leg.id == id))
                  .toList();
          return itinerary.copyWith(legs: legs);
        }).toList();

    return itineraries.where((itinerary) {
      switch (filter) {
        case 'Non-stop':
          // Include itineraries where all legs are non-stop (no stopovers)
          return itinerary.legs.every((leg) => leg.stops == 0);
        case '1 Stop':
          // Include itineraries where all legs have exactly 1 stopover
          return itinerary.legs.every((leg) => leg.stops == 1);
        default:
          return true; // Include all itineraries if no filter is applied
      }
    }).toList();
  }

  @override
  Future<List<AirlineModel>> fetchAirlines({String? filter}) async {
    try {
      final response = await _dio.get(
        'https://raw.githubusercontent.com/Skyscanner/full-stack-recruitment-test/main/public/flights.json',
      );

      final Map<String, dynamic> data =
          response.data is String
              ? jsonDecode(response.data) as Map<String, dynamic>
              : response.data as Map<String, dynamic>;

      final legs =
          (data['legs'] as List<dynamic>?)
              ?.map((e) => LegModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

      final itineraries =
          (data['itineraries'] as List<dynamic>?)
              ?.map((e) => ItineraryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

      final Map<String, AirlineModel> airlineMap = {};

      for (final itinerary in itineraries) {
        for (final legId in itinerary.legIds) {
          try {
            final leg = legs.firstWhere((leg) => leg.id == legId);

            if (leg == null) {
              continue;
            }

            if (airlineMap.containsKey(leg.airlineId)) {
              final existing = airlineMap[leg.airlineId]!;
              airlineMap[leg.airlineId] = existing.copyWith(
                flightCount: existing.flightCount + 1,
              );
            } else {
              airlineMap[leg.airlineId] = AirlineModel(
                id: leg.airlineId,
                name: leg.airlineName,
                flightCount: 1,
              );
            }
          } catch (e) {
            print("Error processing leg $legId: $e");
          }
        }
      }

      final filteredAirlines =
          airlineMap.values.where((airline) {
            return filter == null ||
                airline.name.toLowerCase().contains(filter.toLowerCase());
          }).toList();

      return filteredAirlines;
    } catch (e) {
      throw Exception('Failed to load airlines: $e');
    }
  }
}
