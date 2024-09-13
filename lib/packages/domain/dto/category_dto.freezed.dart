// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) {
  return _CategoryDto.fromJson(json);
}

/// @nodoc
mixin _$CategoryDto {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  set id(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  set name(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'cachable')
  bool? get cachable => throw _privateConstructorUsedError;
  @JsonKey(name: 'cachable')
  set cachable(bool? value) =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'priority') int? priority,
// @JsonKey(name: 'mono') @Default(false) bool mono,
  @JsonKey(name: 'traits')
  List<TraitDto> get traits =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'priority') int? priority,
// @JsonKey(name: 'mono') @Default(false) bool mono,
  @JsonKey(name: 'traits')
  set traits(List<TraitDto> value) => throw _privateConstructorUsedError;

  /// Serializes this CategoryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryDtoCopyWith<CategoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDtoCopyWith<$Res> {
  factory $CategoryDtoCopyWith(
          CategoryDto value, $Res Function(CategoryDto) then) =
      _$CategoryDtoCopyWithImpl<$Res, CategoryDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'cachable') bool? cachable,
      @JsonKey(name: 'traits') List<TraitDto> traits});
}

/// @nodoc
class _$CategoryDtoCopyWithImpl<$Res, $Val extends CategoryDto>
    implements $CategoryDtoCopyWith<$Res> {
  _$CategoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? cachable = freezed,
    Object? traits = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      cachable: freezed == cachable
          ? _value.cachable
          : cachable // ignore: cast_nullable_to_non_nullable
              as bool?,
      traits: null == traits
          ? _value.traits
          : traits // ignore: cast_nullable_to_non_nullable
              as List<TraitDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryDtoImplCopyWith<$Res>
    implements $CategoryDtoCopyWith<$Res> {
  factory _$$CategoryDtoImplCopyWith(
          _$CategoryDtoImpl value, $Res Function(_$CategoryDtoImpl) then) =
      __$$CategoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'cachable') bool? cachable,
      @JsonKey(name: 'traits') List<TraitDto> traits});
}

/// @nodoc
class __$$CategoryDtoImplCopyWithImpl<$Res>
    extends _$CategoryDtoCopyWithImpl<$Res, _$CategoryDtoImpl>
    implements _$$CategoryDtoImplCopyWith<$Res> {
  __$$CategoryDtoImplCopyWithImpl(
      _$CategoryDtoImpl _value, $Res Function(_$CategoryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? cachable = freezed,
    Object? traits = null,
  }) {
    return _then(_$CategoryDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      cachable: freezed == cachable
          ? _value.cachable
          : cachable // ignore: cast_nullable_to_non_nullable
              as bool?,
      traits: null == traits
          ? _value.traits
          : traits // ignore: cast_nullable_to_non_nullable
              as List<TraitDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryDtoImpl implements _CategoryDto {
  _$CategoryDtoImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'cachable') this.cachable,
      @JsonKey(name: 'traits') this.traits = const []});

  factory _$CategoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  String? id;
  @override
  @JsonKey(name: 'name')
  String? name;
  @override
  @JsonKey(name: 'cachable')
  bool? cachable;
// @JsonKey(name: 'priority') int? priority,
// @JsonKey(name: 'mono') @Default(false) bool mono,
  @override
  @JsonKey(name: 'traits')
  List<TraitDto> traits;

  @override
  String toString() {
    return 'CategoryDto(id: $id, name: $name, cachable: $cachable, traits: $traits)';
  }

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryDtoImplCopyWith<_$CategoryDtoImpl> get copyWith =>
      __$$CategoryDtoImplCopyWithImpl<_$CategoryDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryDtoImplToJson(
      this,
    );
  }
}

abstract class _CategoryDto implements CategoryDto {
  factory _CategoryDto(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'cachable') bool? cachable,
      @JsonKey(name: 'traits') List<TraitDto> traits}) = _$CategoryDtoImpl;

  factory _CategoryDto.fromJson(Map<String, dynamic> json) =
      _$CategoryDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @JsonKey(name: 'id')
  set id(String? value);
  @override
  @JsonKey(name: 'name')
  String? get name;
  @JsonKey(name: 'name')
  set name(String? value);
  @override
  @JsonKey(name: 'cachable')
  bool? get cachable;
  @JsonKey(name: 'cachable')
  set cachable(bool? value); // @JsonKey(name: 'priority') int? priority,
// @JsonKey(name: 'mono') @Default(false) bool mono,
  @override
  @JsonKey(name: 'traits')
  List<TraitDto> get traits; // @JsonKey(name: 'priority') int? priority,
// @JsonKey(name: 'mono') @Default(false) bool mono,
  @JsonKey(name: 'traits')
  set traits(List<TraitDto> value);

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryDtoImplCopyWith<_$CategoryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
