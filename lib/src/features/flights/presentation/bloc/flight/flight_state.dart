part of 'flight_cubit.dart';

@freezed
class FlightState with _$FlightState {
  const factory FlightState.initial() = _Initial;

  const factory FlightState.loading() = _Loading;

  const factory FlightState.noInternet() = _NoInternet;

  const factory FlightState.error({ String? message}) =
  _Error;

  const factory FlightState.success(
  {    required List<ItineraryModel> itineraries,
    String? selectedFilter,}) = _Success;
}