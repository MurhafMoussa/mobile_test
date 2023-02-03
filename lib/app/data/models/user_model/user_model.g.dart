// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String?,
      name: json['name'] as String,
      countryCode: json['country_code'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      token: json['token'] as String?,
      tokenExpiry: json['token_expiry'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country_code': instance.countryCode,
      'phone': instance.phone,
      'email': instance.email,
      'token': instance.token,
      'token_expiry': instance.tokenExpiry,
    };
