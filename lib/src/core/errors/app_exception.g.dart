// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppExceptionImpl _$$AppExceptionImplFromJson(Map<String, dynamic> json) =>
    _$AppExceptionImpl(
      message: json['message'] as String,
      statusCode: (json['status_code'] as num?)?.toInt(),
      errors: json['errors'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AppExceptionImplToJson(_$AppExceptionImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status_code': instance.statusCode,
      'errors': instance.errors,
    };
