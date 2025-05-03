// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leg_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LegModelImpl _$$LegModelImplFromJson(Map<String, dynamic> json) =>
    _$LegModelImpl(
      id: json['id'] as String,
      departure: json['departure_airport'] as String,
      arrival: json['arrival_airport'] as String,
      stops: (json['stops'] as num).toInt(),
      airlineId: json['airline_id'] as String,
      airlineName: json['airline_name'] as String,
      duration: (json['duration_mins'] as num).toInt(),
    );

Map<String, dynamic> _$$LegModelImplToJson(_$LegModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'departure_airport': instance.departure,
      'arrival_airport': instance.arrival,
      'stops': instance.stops,
      'airline_id': instance.airlineId,
      'airline_name': instance.airlineName,
      'duration_mins': instance.duration,
    };
