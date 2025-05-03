import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flight/src/features/flights/data/models/leg/leg_model.dart';

part 'itinerary_model.freezed.dart';
part 'itinerary_model.g.dart';

@freezed
class ItineraryModel with _$ItineraryModel {
  const factory ItineraryModel({
    required String id,
    required String price,
    required String agent,
    @JsonKey(name: 'agent_rating') required double agentRating,
    @JsonKey(name: 'legs') required List<String> legIds,
    @JsonKey(ignore: true) @Default([]) List<LegModel> legs,
  }) = _ItineraryModel;

  factory ItineraryModel.fromJson(Map<String, dynamic> json) =>
      _$ItineraryModelFromJson(json);
}


extension ItineraryModelDbExtension on ItineraryModel {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'agent': agent,
      'agent_rating': agentRating,
      'leg_ids': legIds.join(','),
    };
  }

  static ItineraryModel fromMap(Map<String, dynamic> map, List<LegModel> allLegs) {
    final legIds = (map['leg_ids'] as String).split(',');
    final selectedLegs = allLegs.where((leg) => legIds.contains(leg.id)).toList();

    return ItineraryModel(
      id: map['id'],
      price: map['price'],
      agent: map['agent'],
      agentRating: map['agent_rating'],
      legIds: legIds,
      legs: selectedLegs,
    );
  }
}
