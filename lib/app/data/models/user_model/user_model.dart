import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:things_todo/app/domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel extends User with _$UserModel {
  
  factory UserModel({
    String? id,
   required String name,
  required  String countryCode,
  required  String phone,
  required  String email,
    String? token,
    String? tokenExpiry,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

}

extension ToUserModelFromEntity on User {
  UserModel fromEntity(User user) => UserModel(
        name: user.name,
        countryCode: user.countryCode,
        phone: user.phone,
        email: user.email,
      );
}
