import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

/// A base response class generated using Freezed for handling API responses.
///
/// This class represents a standardized response structure typically used across
/// API endpoints in the flight application. It includes fields for success status,
/// message, data payload, and HTTP status code.
@freezed
class BaseResponse with _$BaseResponse {
  /// Construct a BaseResponse instance.
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory BaseResponse({
    /// Indicates whether the API request was successful.
    @Default(false) bool success,

    /// A message associated with the API response, typically used for conveying status or error information.
    String? message,

    /// The data payload received from the API response.
    dynamic data,

    /// The HTTP status code of the API response.
    required int status,
  }) = _BaseResponse;

  /// Deserialize a BaseResponse instance from JSON.
  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
}
