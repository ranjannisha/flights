import 'package:freezed_annotation/freezed_annotation.dart';

part 'airline_model.freezed.dart';
part 'airline_model.g.dart';

@freezed
class AirlineModel with _$AirlineModel {
  const factory AirlineModel({
    required String id,
    required String name,
    @Default(0) int flightCount,
  }) = _AirlineModel;

  factory AirlineModel.fromJson(Map<String, dynamic> json) =>
      _$AirlineModelFromJson(json);
}
