// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_success_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiSuccessResponse<T> _$ApiSuccessResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ApiSuccessResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ApiSuccessResponse<T> {
  String get message => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiSuccessResponseCopyWith<T, ApiSuccessResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiSuccessResponseCopyWith<T, $Res> {
  factory $ApiSuccessResponseCopyWith(ApiSuccessResponse<T> value,
          $Res Function(ApiSuccessResponse<T>) then) =
      _$ApiSuccessResponseCopyWithImpl<T, $Res, ApiSuccessResponse<T>>;
  @useResult
  $Res call({String message, T? data});
}

/// @nodoc
class _$ApiSuccessResponseCopyWithImpl<T, $Res,
        $Val extends ApiSuccessResponse<T>>
    implements $ApiSuccessResponseCopyWith<T, $Res> {
  _$ApiSuccessResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApiSuccessResponseCopyWith<T, $Res>
    implements $ApiSuccessResponseCopyWith<T, $Res> {
  factory _$$_ApiSuccessResponseCopyWith(_$_ApiSuccessResponse<T> value,
          $Res Function(_$_ApiSuccessResponse<T>) then) =
      __$$_ApiSuccessResponseCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String message, T? data});
}

/// @nodoc
class __$$_ApiSuccessResponseCopyWithImpl<T, $Res>
    extends _$ApiSuccessResponseCopyWithImpl<T, $Res, _$_ApiSuccessResponse<T>>
    implements _$$_ApiSuccessResponseCopyWith<T, $Res> {
  __$$_ApiSuccessResponseCopyWithImpl(_$_ApiSuccessResponse<T> _value,
      $Res Function(_$_ApiSuccessResponse<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$_ApiSuccessResponse<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_ApiSuccessResponse<T> implements _ApiSuccessResponse<T> {
  _$_ApiSuccessResponse({required this.message, this.data});

  factory _$_ApiSuccessResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_ApiSuccessResponseFromJson(json, fromJsonT);

  @override
  final String message;
  @override
  final T? data;

  @override
  String toString() {
    return 'ApiSuccessResponse<$T>(message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiSuccessResponse<T> &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiSuccessResponseCopyWith<T, _$_ApiSuccessResponse<T>> get copyWith =>
      __$$_ApiSuccessResponseCopyWithImpl<T, _$_ApiSuccessResponse<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_ApiSuccessResponseToJson<T>(this, toJsonT);
  }
}

abstract class _ApiSuccessResponse<T> implements ApiSuccessResponse<T> {
  factory _ApiSuccessResponse({required final String message, final T? data}) =
      _$_ApiSuccessResponse<T>;

  factory _ApiSuccessResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_ApiSuccessResponse<T>.fromJson;

  @override
  String get message;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ApiSuccessResponseCopyWith<T, _$_ApiSuccessResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
