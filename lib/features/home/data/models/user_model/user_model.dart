import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:things_todo/features/home/domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel extends User with _$UserModel {
  factory UserModel({
   required String id,
  required  String name,
 @JsonKey(name: 'country_code')  required  String countryCode,
   required String phone,
  required  String email,
  required  String token,
 @JsonKey(name: 'token_expiry') required   String tokenExpiry,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}


