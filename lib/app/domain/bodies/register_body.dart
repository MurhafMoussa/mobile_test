
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_body.freezed.dart';
part 'register_body.g.dart';

@freezed
class RegisterBody with _$RegisterBody {
  factory RegisterBody(
    {
      required String email,
      required String password,
     @JsonKey(name: 'password_confirm')
      required String passwordConfirmation,
      required String name,
      required String countryCode,
      required String phone,
    }
  ) = _RegisterBody;
	
  factory RegisterBody.fromJson(Map<String, dynamic> json) =>
			_$RegisterBodyFromJson(json);
}
