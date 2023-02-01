// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisterBody _$RegisterBodyFromJson(Map<String, dynamic> json) {
  return _RegisterBody.fromJson(json);
}

/// @nodoc
mixin _$RegisterBody {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'password_confirm')
  String get passwordConfirmation => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterBodyCopyWith<RegisterBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterBodyCopyWith<$Res> {
  factory $RegisterBodyCopyWith(
          RegisterBody value, $Res Function(RegisterBody) then) =
      _$RegisterBodyCopyWithImpl<$Res, RegisterBody>;
  @useResult
  $Res call(
      {String email,
      String password,
      @JsonKey(name: 'password_confirm') String passwordConfirmation,
      String name,
      String countryCode,
      String phone});
}

/// @nodoc
class _$RegisterBodyCopyWithImpl<$Res, $Val extends RegisterBody>
    implements $RegisterBodyCopyWith<$Res> {
  _$RegisterBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? passwordConfirmation = null,
    Object? name = null,
    Object? countryCode = null,
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: null == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterBodyCopyWith<$Res>
    implements $RegisterBodyCopyWith<$Res> {
  factory _$$_RegisterBodyCopyWith(
          _$_RegisterBody value, $Res Function(_$_RegisterBody) then) =
      __$$_RegisterBodyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      @JsonKey(name: 'password_confirm') String passwordConfirmation,
      String name,
      String countryCode,
      String phone});
}

/// @nodoc
class __$$_RegisterBodyCopyWithImpl<$Res>
    extends _$RegisterBodyCopyWithImpl<$Res, _$_RegisterBody>
    implements _$$_RegisterBodyCopyWith<$Res> {
  __$$_RegisterBodyCopyWithImpl(
      _$_RegisterBody _value, $Res Function(_$_RegisterBody) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? passwordConfirmation = null,
    Object? name = null,
    Object? countryCode = null,
    Object? phone = null,
  }) {
    return _then(_$_RegisterBody(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: null == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegisterBody implements _RegisterBody {
  _$_RegisterBody(
      {required this.email,
      required this.password,
      @JsonKey(name: 'password_confirm') required this.passwordConfirmation,
      required this.name,
      required this.countryCode,
      required this.phone});

  factory _$_RegisterBody.fromJson(Map<String, dynamic> json) =>
      _$$_RegisterBodyFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  @JsonKey(name: 'password_confirm')
  final String passwordConfirmation;
  @override
  final String name;
  @override
  final String countryCode;
  @override
  final String phone;

  @override
  String toString() {
    return 'RegisterBody(email: $email, password: $password, passwordConfirmation: $passwordConfirmation, name: $name, countryCode: $countryCode, phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterBody &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password,
      passwordConfirmation, name, countryCode, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterBodyCopyWith<_$_RegisterBody> get copyWith =>
      __$$_RegisterBodyCopyWithImpl<_$_RegisterBody>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegisterBodyToJson(
      this,
    );
  }
}

abstract class _RegisterBody implements RegisterBody {
  factory _RegisterBody(
      {required final String email,
      required final String password,
      @JsonKey(name: 'password_confirm')
          required final String passwordConfirmation,
      required final String name,
      required final String countryCode,
      required final String phone}) = _$_RegisterBody;

  factory _RegisterBody.fromJson(Map<String, dynamic> json) =
      _$_RegisterBody.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(name: 'password_confirm')
  String get passwordConfirmation;
  @override
  String get name;
  @override
  String get countryCode;
  @override
  String get phone;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterBodyCopyWith<_$_RegisterBody> get copyWith =>
      throw _privateConstructorUsedError;
}
