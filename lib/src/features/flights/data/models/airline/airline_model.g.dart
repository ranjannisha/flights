// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AirlineModelImpl _$$AirlineModelImplFromJson(Map<String, dynamic> json) =>
    _$AirlineModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      flightCount: (json['flightCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$AirlineModelImplToJson(_$AirlineModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'flightCount': instance.flightCount,
    };
