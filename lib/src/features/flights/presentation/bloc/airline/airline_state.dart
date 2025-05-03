part of 'airline_cubit.dart';

@freezed
class AirlineState with _$AirlineState {
  const factory AirlineState.initial() = _Initial;

  const factory AirlineState.loading() = _Loading;

  const factory AirlineState.noInternet() = _NoInternet;

  const factory AirlineState.error({String? message}) = _Error;

  const factory AirlineState.success({
    required List<AirlineModel> airlines,
    required List<LegModel> allLegs,
    String? selectedAirlineFilter,
  }) = _Success;
}