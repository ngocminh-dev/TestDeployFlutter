// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'predefined_image_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PredefinedImageDto _$PredefinedImageDtoFromJson(Map<String, dynamic> json) {
  return _PredefinedImageDto.fromJson(json);
}

/// @nodoc
mixin _$PredefinedImageDto {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  set id(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  set url(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'priority')
  int? get priority => throw _privateConstructorUsedError;
  @JsonKey(name: 'priority')
  set priority(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  set gender(String? value) => throw _privateConstructorUsedError;

  /// Serializes this PredefinedImageDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PredefinedImageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PredefinedImageDtoCopyWith<PredefinedImageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredefinedImageDtoCopyWith<$Res> {
  factory $PredefinedImageDtoCopyWith(
          PredefinedImageDto value, $Res Function(PredefinedImageDto) then) =
      _$PredefinedImageDtoCopyWithImpl<$Res, PredefinedImageDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'priority') int? priority,
      @JsonKey(name: 'gender') String? gender});
}

/// @nodoc
class _$PredefinedImageDtoCopyWithImpl<$Res, $Val extends PredefinedImageDto>
    implements $PredefinedImageDtoCopyWith<$Res> {
  _$PredefinedImageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PredefinedImageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
    Object? priority = freezed,
    Object? gender = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PredefinedImageDtoImplCopyWith<$Res>
    implements $PredefinedImageDtoCopyWith<$Res> {
  factory _$$PredefinedImageDtoImplCopyWith(_$PredefinedImageDtoImpl value,
          $Res Function(_$PredefinedImageDtoImpl) then) =
      __$$PredefinedImageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'priority') int? priority,
      @JsonKey(name: 'gender') String? gender});
}

/// @nodoc
class __$$PredefinedImageDtoImplCopyWithImpl<$Res>
    extends _$PredefinedImageDtoCopyWithImpl<$Res, _$PredefinedImageDtoImpl>
    implements _$$PredefinedImageDtoImplCopyWith<$Res> {
  __$$PredefinedImageDtoImplCopyWithImpl(_$PredefinedImageDtoImpl _value,
      $Res Function(_$PredefinedImageDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PredefinedImageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
    Object? priority = freezed,
    Object? gender = freezed,
  }) {
    return _then(_$PredefinedImageDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PredefinedImageDtoImpl implements _PredefinedImageDto {
  _$PredefinedImageDtoImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'url') this.url,
      @JsonKey(name: 'priority') this.priority,
      @JsonKey(name: 'gender') this.gender});

  factory _$PredefinedImageDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PredefinedImageDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  String? id;
  @override
  @JsonKey(name: 'url')
  String? url;
  @override
  @JsonKey(name: 'priority')
  int? priority;
  @override
  @JsonKey(name: 'gender')
  String? gender;

  @override
  String toString() {
    return 'PredefinedImageDto(id: $id, url: $url, priority: $priority, gender: $gender)';
  }

  /// Create a copy of PredefinedImageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PredefinedImageDtoImplCopyWith<_$PredefinedImageDtoImpl> get copyWith =>
      __$$PredefinedImageDtoImplCopyWithImpl<_$PredefinedImageDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PredefinedImageDtoImplToJson(
      this,
    );
  }
}

abstract class _PredefinedImageDto implements PredefinedImageDto {
  factory _PredefinedImageDto(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'priority') int? priority,
      @JsonKey(name: 'gender') String? gender}) = _$PredefinedImageDtoImpl;

  factory _PredefinedImageDto.fromJson(Map<String, dynamic> json) =
      _$PredefinedImageDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @JsonKey(name: 'id')
  set id(String? value);
  @override
  @JsonKey(name: 'url')
  String? get url;
  @JsonKey(name: 'url')
  set url(String? value);
  @override
  @JsonKey(name: 'priority')
  int? get priority;
  @JsonKey(name: 'priority')
  set priority(int? value);
  @override
  @JsonKey(name: 'gender')
  String? get gender;
  @JsonKey(name: 'gender')
  set gender(String? value);

  /// Create a copy of PredefinedImageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PredefinedImageDtoImplCopyWith<_$PredefinedImageDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
