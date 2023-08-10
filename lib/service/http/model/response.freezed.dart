// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HttpResponseModel _$HttpResponseModelFromJson(Map<String, dynamic> json) {
  return _HttpResponseModel.fromJson(json);
}

/// @nodoc
mixin _$HttpResponseModel {
  int? get statusCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Object? get data => throw _privateConstructorUsedError;
  Map<String, List<String>>? get headers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HttpResponseModelCopyWith<HttpResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HttpResponseModelCopyWith<$Res> {
  factory $HttpResponseModelCopyWith(
          HttpResponseModel value, $Res Function(HttpResponseModel) then) =
      _$HttpResponseModelCopyWithImpl<$Res, HttpResponseModel>;
  @useResult
  $Res call(
      {int? statusCode,
      String? message,
      Object? data,
      Map<String, List<String>>? headers});
}

/// @nodoc
class _$HttpResponseModelCopyWithImpl<$Res, $Val extends HttpResponseModel>
    implements $HttpResponseModelCopyWith<$Res> {
  _$HttpResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? headers = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data ? _value.data : data,
      headers: freezed == headers
          ? _value.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HttpResponseModelCopyWith<$Res>
    implements $HttpResponseModelCopyWith<$Res> {
  factory _$$_HttpResponseModelCopyWith(_$_HttpResponseModel value,
          $Res Function(_$_HttpResponseModel) then) =
      __$$_HttpResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? statusCode,
      String? message,
      Object? data,
      Map<String, List<String>>? headers});
}

/// @nodoc
class __$$_HttpResponseModelCopyWithImpl<$Res>
    extends _$HttpResponseModelCopyWithImpl<$Res, _$_HttpResponseModel>
    implements _$$_HttpResponseModelCopyWith<$Res> {
  __$$_HttpResponseModelCopyWithImpl(
      _$_HttpResponseModel _value, $Res Function(_$_HttpResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? headers = freezed,
  }) {
    return _then(_$_HttpResponseModel(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data ? _value.data : data,
      headers: freezed == headers
          ? _value._headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_HttpResponseModel extends _HttpResponseModel {
  const _$_HttpResponseModel(
      {this.statusCode,
      this.message,
      this.data,
      final Map<String, List<String>>? headers})
      : _headers = headers,
        super._();

  factory _$_HttpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_HttpResponseModelFromJson(json);

  @override
  final int? statusCode;
  @override
  final String? message;
  @override
  final Object? data;
  final Map<String, List<String>>? _headers;
  @override
  Map<String, List<String>>? get headers {
    final value = _headers;
    if (value == null) return null;
    if (_headers is EqualUnmodifiableMapView) return _headers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'HttpResponseModel(statusCode: $statusCode, message: $message, data: $data, headers: $headers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HttpResponseModel &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other._headers, _headers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusCode,
      message,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(_headers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HttpResponseModelCopyWith<_$_HttpResponseModel> get copyWith =>
      __$$_HttpResponseModelCopyWithImpl<_$_HttpResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HttpResponseModelToJson(
      this,
    );
  }
}

abstract class _HttpResponseModel extends HttpResponseModel {
  const factory _HttpResponseModel(
      {final int? statusCode,
      final String? message,
      final Object? data,
      final Map<String, List<String>>? headers}) = _$_HttpResponseModel;
  const _HttpResponseModel._() : super._();

  factory _HttpResponseModel.fromJson(Map<String, dynamic> json) =
      _$_HttpResponseModel.fromJson;

  @override
  int? get statusCode;
  @override
  String? get message;
  @override
  Object? get data;
  @override
  Map<String, List<String>>? get headers;
  @override
  @JsonKey(ignore: true)
  _$$_HttpResponseModelCopyWith<_$_HttpResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
