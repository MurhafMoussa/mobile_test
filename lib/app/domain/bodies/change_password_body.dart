import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_body.freezed.dart';
part 'change_password_body.g.dart';

@freezed
class ChangePasswordBody with _$ChangePasswordBody {
  factory ChangePasswordBody({
    @JsonKey(name: 'password') required String newPassword,
    @JsonKey(name: 'password_confirm') required String newPasswordConfirmation,
    @JsonKey(name: 'current_password') required String oldPassword,
  }) = _ChangePasswordBody;

  factory ChangePasswordBody.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordBodyFromJson(json);
}
