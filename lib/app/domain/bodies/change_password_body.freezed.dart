// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChangePasswordBody _$ChangePasswordBodyFromJson(Map<String, dynamic> json) {
  return _ChangePasswordBody.fromJson(json);
}

/// @nodoc
mixin _$ChangePasswordBody {
  @JsonKey(name: 'password')
  String get newPassword => throw _privateConstructorUsedError;
  @JsonKey(name: 'password_confirm')
  String get newPasswordConfirmation => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_password')
  String get oldPassword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangePasswordBodyCopyWith<ChangePasswordBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordBodyCopyWith<$Res> {
  factory $ChangePasswordBodyCopyWith(
          ChangePasswordBody value, $Res Function(ChangePasswordBody) then) =
      _$ChangePasswordBodyCopyWithImpl<$Res, ChangePasswordBody>;
  @useResult
  $Res call(
      {@JsonKey(name: 'password') String newPassword,
      @JsonKey(name: 'password_confirm') String newPasswordConfirmation,
      @JsonKey(name: 'current_password') String oldPassword});
}

/// @nodoc
class _$ChangePasswordBodyCopyWithImpl<$Res, $Val extends ChangePasswordBody>
    implements $ChangePasswordBodyCopyWith<$Res> {
  _$ChangePasswordBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPassword = null,
    Object? newPasswordConfirmation = null,
    Object? oldPassword = null,
  }) {
    return _then(_value.copyWith(
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPasswordConfirmation: null == newPasswordConfirmation
          ? _value.newPasswordConfirmation
          : newPasswordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
      oldPassword: null == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChangePasswordBodyCopyWith<$Res>
    implements $ChangePasswordBodyCopyWith<$Res> {
  factory _$$_ChangePasswordBodyCopyWith(_$_ChangePasswordBody value,
          $Res Function(_$_ChangePasswordBody) then) =
      __$$_ChangePasswordBodyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'password') String newPassword,
      @JsonKey(name: 'password_confirm') String newPasswordConfirmation,
      @JsonKey(name: 'current_password') String oldPassword});
}

/// @nodoc
class __$$_ChangePasswordBodyCopyWithImpl<$Res>
    extends _$ChangePasswordBodyCopyWithImpl<$Res, _$_ChangePasswordBody>
    implements _$$_ChangePasswordBodyCopyWith<$Res> {
  __$$_ChangePasswordBodyCopyWithImpl(
      _$_ChangePasswordBody _value, $Res Function(_$_ChangePasswordBody) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPassword = null,
    Object? newPasswordConfirmation = null,
    Object? oldPassword = null,
  }) {
    return _then(_$_ChangePasswordBody(
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPasswordConfirmation: null == newPasswordConfirmation
          ? _value.newPasswordConfirmation
          : newPasswordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
      oldPassword: null == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChangePasswordBody implements _ChangePasswordBody {
  _$_ChangePasswordBody(
      {@JsonKey(name: 'password') required this.newPassword,
      @JsonKey(name: 'password_confirm') required this.newPasswordConfirmation,
      @JsonKey(name: 'current_password') required this.oldPassword});

  factory _$_ChangePasswordBody.fromJson(Map<String, dynamic> json) =>
      _$$_ChangePasswordBodyFromJson(json);

  @override
  @JsonKey(name: 'password')
  final String newPassword;
  @override
  @JsonKey(name: 'password_confirm')
  final String newPasswordConfirmation;
  @override
  @JsonKey(name: 'current_password')
  final String oldPassword;

  @override
  String toString() {
    return 'ChangePasswordBody(newPassword: $newPassword, newPasswordConfirmation: $newPasswordConfirmation, oldPassword: $oldPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangePasswordBody &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(
                    other.newPasswordConfirmation, newPasswordConfirmation) ||
                other.newPasswordConfirmation == newPasswordConfirmation) &&
            (identical(other.oldPassword, oldPassword) ||
                other.oldPassword == oldPassword));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, newPassword, newPasswordConfirmation, oldPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangePasswordBodyCopyWith<_$_ChangePasswordBody> get copyWith =>
      __$$_ChangePasswordBodyCopyWithImpl<_$_ChangePasswordBody>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChangePasswordBodyToJson(
      this,
    );
  }
}

abstract class _ChangePasswordBody implements ChangePasswordBody {
  factory _ChangePasswordBody(
      {@JsonKey(name: 'password')
          required final String newPassword,
      @JsonKey(name: 'password_confirm')
          required final String newPasswordConfirmation,
      @JsonKey(name: 'current_password')
          required final String oldPassword}) = _$_ChangePasswordBody;

  factory _ChangePasswordBody.fromJson(Map<String, dynamic> json) =
      _$_ChangePasswordBody.fromJson;

  @override
  @JsonKey(name: 'password')
  String get newPassword;
  @override
  @JsonKey(name: 'password_confirm')
  String get newPasswordConfirmation;
  @override
  @JsonKey(name: 'current_password')
  String get oldPassword;
  @override
  @JsonKey(ignore: true)
  _$$_ChangePasswordBodyCopyWith<_$_ChangePasswordBody> get copyWith =>
      throw _privateConstructorUsedError;
}
