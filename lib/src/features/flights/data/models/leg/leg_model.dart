import 'package:freezed_annotation/freezed_annotation.dart';

part 'leg_model.freezed.dart';
part 'leg_model.g.dart';

@freezed
class LegModel with _$LegModel {
  const factory LegModel({
    required String id,
    @JsonKey(name: 'departure_airport') required String departure,
    @JsonKey(name: 'arrival_airport') required String arrival,
    @JsonKey(name: 'stops') required int stops,
    @JsonKey(name: 'airline_id') required String airlineId,
    @JsonKey(name: 'airline_name') required String airlineName,
    @JsonKey(name: 'duration_mins') required int duration,
  }) = _LegModel;

  factory LegModel.fromJson(Map<String, dynamic> json) =>
      _$LegModelFromJson(json);
}

extension LegModelDbExtension on LegModel {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'departure': departure,
      'arrival': arrival,
      'stops': stops,
      'airline_id': airlineId,
      'airline_name': airlineName,
      'duration': duration,
    };
  }

  static LegModel fromMap(Map<String, dynamic> map) {
    return LegModel(
      id: map['id'],
      departure: map['departure'],
      arrival: map['arrival'],
      stops: map['stops'],
      airlineId: map['airline_id'],
      airlineName: map['airline_name'],
      duration: map['duration'],
    );
  }
}
