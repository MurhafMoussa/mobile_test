// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChangePasswordBody _$$_ChangePasswordBodyFromJson(
        Map<String, dynamic> json) =>
    _$_ChangePasswordBody(
      newPassword: json['password'] as String,
      newPasswordConfirmation: json['password_confirm'] as String,
      oldPassword: json['current_password'] as String,
    );

Map<String, dynamic> _$$_ChangePasswordBodyToJson(
        _$_ChangePasswordBody instance) =>
    <String, dynamic>{
      'password': instance.newPassword,
      'password_confirm': instance.newPasswordConfirmation,
      'current_password': instance.oldPassword,
    };
