// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pricing_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PricingDto _$PricingDtoFromJson(Map<String, dynamic> json) {
  return _PricingDto.fromJson(json);
}

/// @nodoc
mixin _$PricingDto {
  @JsonKey(name: 'step')
  int? get step => throw _privateConstructorUsedError;
  @JsonKey(name: 'step')
  set step(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_per_step')
  int? get price_per_step => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_per_step')
  set price_per_step(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_code')
  String? get country_code => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_code')
  set country_code(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency')
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency')
  set currency(String? value) => throw _privateConstructorUsedError;

  /// Serializes this PricingDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PricingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PricingDtoCopyWith<PricingDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PricingDtoCopyWith<$Res> {
  factory $PricingDtoCopyWith(
          PricingDto value, $Res Function(PricingDto) then) =
      _$PricingDtoCopyWithImpl<$Res, PricingDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'step') int? step,
      @JsonKey(name: 'price_per_step') int? price_per_step,
      @JsonKey(name: 'country_code') String? country_code,
      @JsonKey(name: 'currency') String? currency});
}

/// @nodoc
class _$PricingDtoCopyWithImpl<$Res, $Val extends PricingDto>
    implements $PricingDtoCopyWith<$Res> {
  _$PricingDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PricingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = freezed,
    Object? price_per_step = freezed,
    Object? country_code = freezed,
    Object? currency = freezed,
  }) {
    return _then(_value.copyWith(
      step: freezed == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int?,
      price_per_step: freezed == price_per_step
          ? _value.price_per_step
          : price_per_step // ignore: cast_nullable_to_non_nullable
              as int?,
      country_code: freezed == country_code
          ? _value.country_code
          : country_code // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PricingDtoImplCopyWith<$Res>
    implements $PricingDtoCopyWith<$Res> {
  factory _$$PricingDtoImplCopyWith(
          _$PricingDtoImpl value, $Res Function(_$PricingDtoImpl) then) =
      __$$PricingDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'step') int? step,
      @JsonKey(name: 'price_per_step') int? price_per_step,
      @JsonKey(name: 'country_code') String? country_code,
      @JsonKey(name: 'currency') String? currency});
}

/// @nodoc
class __$$PricingDtoImplCopyWithImpl<$Res>
    extends _$PricingDtoCopyWithImpl<$Res, _$PricingDtoImpl>
    implements _$$PricingDtoImplCopyWith<$Res> {
  __$$PricingDtoImplCopyWithImpl(
      _$PricingDtoImpl _value, $Res Function(_$PricingDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PricingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = freezed,
    Object? price_per_step = freezed,
    Object? country_code = freezed,
    Object? currency = freezed,
  }) {
    return _then(_$PricingDtoImpl(
      step: freezed == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int?,
      price_per_step: freezed == price_per_step
          ? _value.price_per_step
          : price_per_step // ignore: cast_nullable_to_non_nullable
              as int?,
      country_code: freezed == country_code
          ? _value.country_code
          : country_code // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PricingDtoImpl implements _PricingDto {
  _$PricingDtoImpl(
      {@JsonKey(name: 'step') this.step,
      @JsonKey(name: 'price_per_step') this.price_per_step,
      @JsonKey(name: 'country_code') this.country_code,
      @JsonKey(name: 'currency') this.currency});

  factory _$PricingDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PricingDtoImplFromJson(json);

  @override
  @JsonKey(name: 'step')
  int? step;
  @override
  @JsonKey(name: 'price_per_step')
  int? price_per_step;
  @override
  @JsonKey(name: 'country_code')
  String? country_code;
  @override
  @JsonKey(name: 'currency')
  String? currency;

  @override
  String toString() {
    return 'PricingDto(step: $step, price_per_step: $price_per_step, country_code: $country_code, currency: $currency)';
  }

  /// Create a copy of PricingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PricingDtoImplCopyWith<_$PricingDtoImpl> get copyWith =>
      __$$PricingDtoImplCopyWithImpl<_$PricingDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PricingDtoImplToJson(
      this,
    );
  }
}

abstract class _PricingDto implements PricingDto {
  factory _PricingDto(
      {@JsonKey(name: 'step') int? step,
      @JsonKey(name: 'price_per_step') int? price_per_step,
      @JsonKey(name: 'country_code') String? country_code,
      @JsonKey(name: 'currency') String? currency}) = _$PricingDtoImpl;

  factory _PricingDto.fromJson(Map<String, dynamic> json) =
      _$PricingDtoImpl.fromJson;

  @override
  @JsonKey(name: 'step')
  int? get step;
  @JsonKey(name: 'step')
  set step(int? value);
  @override
  @JsonKey(name: 'price_per_step')
  int? get price_per_step;
  @JsonKey(name: 'price_per_step')
  set price_per_step(int? value);
  @override
  @JsonKey(name: 'country_code')
  String? get country_code;
  @JsonKey(name: 'country_code')
  set country_code(String? value);
  @override
  @JsonKey(name: 'currency')
  String? get currency;
  @JsonKey(name: 'currency')
  set currency(String? value);

  /// Create a copy of PricingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PricingDtoImplCopyWith<_$PricingDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
