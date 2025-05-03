// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardResponseModelImpl _$$DashboardResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardResponseModelImpl(
      cards: (json['cards'] as List<dynamic>)
          .map((e) => CarModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      budget: BudgetModel.fromJson(json['budget'] as Map<String, dynamic>),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$DashboardResponseModelImplToJson(
        _$DashboardResponseModelImpl instance) =>
    <String, dynamic>{
      'cards': instance.cards,
      'budget': instance.budget,
      'images': instance.images,
    };

_$BudgetModelImpl _$$BudgetModelImplFromJson(Map<String, dynamic> json) =>
    _$BudgetModelImpl(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      percentage: (json['percentage'] as num).toDouble(),
      spent: json['spent'] as String,
      remaining: json['remaining'] as String,
    );

Map<String, dynamic> _$$BudgetModelImplToJson(_$BudgetModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'percentage': instance.percentage,
      'spent': instance.spent,
      'remaining': instance.remaining,
    };

_$CarModelImpl _$$CarModelImplFromJson(Map<String, dynamic> json) =>
    _$CarModelImpl(
      title: json['title'] as String,
      count: (json['count'] as num).toInt(),
      percent: (json['percent'] as num).toDouble(),
      value: json['value'] as String,
    );

Map<String, dynamic> _$$CarModelImplToJson(_$CarModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'count': instance.count,
      'percent': instance.percent,
      'value': instance.value,
    };
