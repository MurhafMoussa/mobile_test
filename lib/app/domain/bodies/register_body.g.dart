// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegisterBody _$$_RegisterBodyFromJson(Map<String, dynamic> json) =>
    _$_RegisterBody(
      email: json['email'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['password_confirm'] as String,
      name: json['name'] as String,
      countryCode: json['country_code'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$$_RegisterBodyToJson(_$_RegisterBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'password_confirm': instance.passwordConfirmation,
      'name': instance.name,
      'country_code': instance.countryCode,
      'phone': instance.phone,
    };
