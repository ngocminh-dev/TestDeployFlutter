// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trait_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TraitDto _$TraitDtoFromJson(Map<String, dynamic> json) {
  return _TraitDto.fromJson(json);
}

/// @nodoc
mixin _$TraitDto {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  set id(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  set name(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  String? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  set categoryId(String? value) => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;
  set selected(bool value) => throw _privateConstructorUsedError;

  /// Serializes this TraitDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TraitDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TraitDtoCopyWith<TraitDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TraitDtoCopyWith<$Res> {
  factory $TraitDtoCopyWith(TraitDto value, $Res Function(TraitDto) then) =
      _$TraitDtoCopyWithImpl<$Res, TraitDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'category_id') String? categoryId,
      bool selected});
}

/// @nodoc
class _$TraitDtoCopyWithImpl<$Res, $Val extends TraitDto>
    implements $TraitDtoCopyWith<$Res> {
  _$TraitDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TraitDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? categoryId = freezed,
    Object? selected = null,
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
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TraitDtoImplCopyWith<$Res>
    implements $TraitDtoCopyWith<$Res> {
  factory _$$TraitDtoImplCopyWith(
          _$TraitDtoImpl value, $Res Function(_$TraitDtoImpl) then) =
      __$$TraitDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'category_id') String? categoryId,
      bool selected});
}

/// @nodoc
class __$$TraitDtoImplCopyWithImpl<$Res>
    extends _$TraitDtoCopyWithImpl<$Res, _$TraitDtoImpl>
    implements _$$TraitDtoImplCopyWith<$Res> {
  __$$TraitDtoImplCopyWithImpl(
      _$TraitDtoImpl _value, $Res Function(_$TraitDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TraitDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? categoryId = freezed,
    Object? selected = null,
  }) {
    return _then(_$TraitDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TraitDtoImpl implements _TraitDto {
  _$TraitDtoImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'category_id') this.categoryId,
      this.selected = false});

  factory _$TraitDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TraitDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  String? id;
  @override
  @JsonKey(name: 'name')
  String? name;
  @override
  @JsonKey(name: 'category_id')
  String? categoryId;
  @override
  @JsonKey()
  bool selected;

  @override
  String toString() {
    return 'TraitDto(id: $id, name: $name, categoryId: $categoryId, selected: $selected)';
  }

  /// Create a copy of TraitDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TraitDtoImplCopyWith<_$TraitDtoImpl> get copyWith =>
      __$$TraitDtoImplCopyWithImpl<_$TraitDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TraitDtoImplToJson(
      this,
    );
  }
}

abstract class _TraitDto implements TraitDto {
  factory _TraitDto(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'category_id') String? categoryId,
      bool selected}) = _$TraitDtoImpl;

  factory _TraitDto.fromJson(Map<String, dynamic> json) =
      _$TraitDtoImpl.fromJson;

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
  @JsonKey(name: 'category_id')
  String? get categoryId;
  @JsonKey(name: 'category_id')
  set categoryId(String? value);
  @override
  bool get selected;
  set selected(bool value);

  /// Create a copy of TraitDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TraitDtoImplCopyWith<_$TraitDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
