// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItineraryModelImpl _$$ItineraryModelImplFromJson(Map<String, dynamic> json) =>
    _$ItineraryModelImpl(
      id: json['id'] as String,
      price: json['price'] as String,
      agent: json['agent'] as String,
      agentRating: (json['agent_rating'] as num).toDouble(),
      legIds: (json['legs'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ItineraryModelImplToJson(
        _$ItineraryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'agent': instance.agent,
      'agent_rating': instance.agentRating,
      'legs': instance.legIds,
    };
