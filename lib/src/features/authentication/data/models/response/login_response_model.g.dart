// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseModelImpl _$$LoginResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginResponseModelImpl(
      status: (json['status'] as num?)?.toInt(),
      email: json['email'] as String?,
      uid: json['uid'] as String?,
      message: json['message'] as String?,
      data: json['data'] as bool?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$LoginResponseModelImplToJson(
        _$LoginResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'email': instance.email,
      'uid': instance.uid,
      'message': instance.message,
      'data': instance.data,
      'token': instance.token,
    };
