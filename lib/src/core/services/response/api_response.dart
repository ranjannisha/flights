import 'package:equatable/equatable.dart';

/// A generic class representing the response from an API request.
///
/// This class encapsulates the success status, data, message, and optional error code
/// received from the API endpoint. It is parameterized by type T to allow flexibility
/// in the data type of the response payload.
class ApiResponse<T> extends Equatable {
  const ApiResponse({
    required this.success,
    required this.data,
    required this.message,
    this.code,
  });

  /// Indicates whether the API request was successful.
  final bool success;

  /// A message associated with the API response, typically used for conveying status or error information.
  final String? message;

  /// The data payload received from the API response.
  final T data;

  /// An optional error code associated with the response, if applicable.
  final int? code;

  @override
  List<Object?> get props => [success, message, data];
}
