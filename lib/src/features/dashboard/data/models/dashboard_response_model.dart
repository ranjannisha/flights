import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_response_model.freezed.dart';
part 'dashboard_response_model.g.dart';

@freezed
class DashboardResponseModel with _$DashboardResponseModel {
  const factory DashboardResponseModel({
    required List<CarModel> cards,
    required BudgetModel budget,
    required List<String> images,
  }) = _DashboardResponseModel;

  factory DashboardResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardResponseModelFromJson(json);
}

@freezed
class BudgetModel with _$BudgetModel {
  const factory BudgetModel({
    required String title,
    required String subtitle,
    required double percentage,
    required String spent,
    required String remaining,
  }) = _BudgetModel;

  factory BudgetModel.fromJson(Map<String, dynamic> json) =>
      _$BudgetModelFromJson(json);
}

@freezed
class CarModel with _$CarModel {
  const factory CarModel({
    required String title,
    required int count,
    required double percent,
    required String value,
  }) = _CarModel;

  factory CarModel.fromJson(Map<String, dynamic> json) =>
      _$CarModelFromJson(json);
}
