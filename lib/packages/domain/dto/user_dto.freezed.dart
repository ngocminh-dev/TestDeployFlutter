// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

/// @nodoc
mixin _$UserDto {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  set id(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'free_clicks')
  int? get freeClicks => throw _privateConstructorUsedError;
  @JsonKey(name: 'free_clicks')
  set freeClicks(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'premium_clicks')
  int? get premiumClicks => throw _privateConstructorUsedError;
  @JsonKey(name: 'premium_clicks')
  set premiumClicks(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_anonymous')
  bool get isAnonymous => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_anonymous')
  set isAnonymous(bool value) => throw _privateConstructorUsedError;

  /// Serializes this UserDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res, UserDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'free_clicks') int? freeClicks,
      @JsonKey(name: 'premium_clicks') int? premiumClicks,
      @JsonKey(name: 'is_anonymous') bool isAnonymous});
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res, $Val extends UserDto>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? freeClicks = freezed,
    Object? premiumClicks = freezed,
    Object? isAnonymous = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      freeClicks: freezed == freeClicks
          ? _value.freeClicks
          : freeClicks // ignore: cast_nullable_to_non_nullable
              as int?,
      premiumClicks: freezed == premiumClicks
          ? _value.premiumClicks
          : premiumClicks // ignore: cast_nullable_to_non_nullable
              as int?,
      isAnonymous: null == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDtoImplCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$$UserDtoImplCopyWith(
          _$UserDtoImpl value, $Res Function(_$UserDtoImpl) then) =
      __$$UserDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'free_clicks') int? freeClicks,
      @JsonKey(name: 'premium_clicks') int? premiumClicks,
      @JsonKey(name: 'is_anonymous') bool isAnonymous});
}

/// @nodoc
class __$$UserDtoImplCopyWithImpl<$Res>
    extends _$UserDtoCopyWithImpl<$Res, _$UserDtoImpl>
    implements _$$UserDtoImplCopyWith<$Res> {
  __$$UserDtoImplCopyWithImpl(
      _$UserDtoImpl _value, $Res Function(_$UserDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? freeClicks = freezed,
    Object? premiumClicks = freezed,
    Object? isAnonymous = null,
  }) {
    return _then(_$UserDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      freeClicks: freezed == freeClicks
          ? _value.freeClicks
          : freeClicks // ignore: cast_nullable_to_non_nullable
              as int?,
      premiumClicks: freezed == premiumClicks
          ? _value.premiumClicks
          : premiumClicks // ignore: cast_nullable_to_non_nullable
              as int?,
      isAnonymous: null == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDtoImpl implements _UserDto {
  _$UserDtoImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'free_clicks') this.freeClicks,
      @JsonKey(name: 'premium_clicks') this.premiumClicks,
      @JsonKey(name: 'is_anonymous') this.isAnonymous = true});

  factory _$UserDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  String? id;
  @override
  @JsonKey(name: 'free_clicks')
  int? freeClicks;
  @override
  @JsonKey(name: 'premium_clicks')
  int? premiumClicks;
  @override
  @JsonKey(name: 'is_anonymous')
  bool isAnonymous;

  @override
  String toString() {
    return 'UserDto(id: $id, freeClicks: $freeClicks, premiumClicks: $premiumClicks, isAnonymous: $isAnonymous)';
  }

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      __$$UserDtoImplCopyWithImpl<_$UserDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDtoImplToJson(
      this,
    );
  }
}

abstract class _UserDto implements UserDto {
  factory _UserDto(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'free_clicks') int? freeClicks,
      @JsonKey(name: 'premium_clicks') int? premiumClicks,
      @JsonKey(name: 'is_anonymous') bool isAnonymous}) = _$UserDtoImpl;

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$UserDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @JsonKey(name: 'id')
  set id(String? value);
  @override
  @JsonKey(name: 'free_clicks')
  int? get freeClicks;
  @JsonKey(name: 'free_clicks')
  set freeClicks(int? value);
  @override
  @JsonKey(name: 'premium_clicks')
  int? get premiumClicks;
  @JsonKey(name: 'premium_clicks')
  set premiumClicks(int? value);
  @override
  @JsonKey(name: 'is_anonymous')
  bool get isAnonymous;
  @JsonKey(name: 'is_anonymous')
  set isAnonymous(bool value);

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
