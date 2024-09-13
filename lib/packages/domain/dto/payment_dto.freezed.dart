// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentDto _$PaymentDtoFromJson(Map<String, dynamic> json) {
  return _PaymentDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentDto {
  @JsonKey(name: 'qr_image_link')
  String? get qr_image_link => throw _privateConstructorUsedError;
  @JsonKey(name: 'qr_image_link')
  set qr_image_link(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  String? get order_id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  set order_id(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'transfer_amount')
  int? get transfer_amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'transfer_amount')
  set transfer_amount(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'transfer_currency')
  String? get transfer_currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'transfer_currency')
  set transfer_currency(String? value) => throw _privateConstructorUsedError;

  /// Serializes this PaymentDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentDtoCopyWith<PaymentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDtoCopyWith<$Res> {
  factory $PaymentDtoCopyWith(
          PaymentDto value, $Res Function(PaymentDto) then) =
      _$PaymentDtoCopyWithImpl<$Res, PaymentDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'qr_image_link') String? qr_image_link,
      @JsonKey(name: 'order_id') String? order_id,
      @JsonKey(name: 'transfer_amount') int? transfer_amount,
      @JsonKey(name: 'transfer_currency') String? transfer_currency});
}

/// @nodoc
class _$PaymentDtoCopyWithImpl<$Res, $Val extends PaymentDto>
    implements $PaymentDtoCopyWith<$Res> {
  _$PaymentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qr_image_link = freezed,
    Object? order_id = freezed,
    Object? transfer_amount = freezed,
    Object? transfer_currency = freezed,
  }) {
    return _then(_value.copyWith(
      qr_image_link: freezed == qr_image_link
          ? _value.qr_image_link
          : qr_image_link // ignore: cast_nullable_to_non_nullable
              as String?,
      order_id: freezed == order_id
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as String?,
      transfer_amount: freezed == transfer_amount
          ? _value.transfer_amount
          : transfer_amount // ignore: cast_nullable_to_non_nullable
              as int?,
      transfer_currency: freezed == transfer_currency
          ? _value.transfer_currency
          : transfer_currency // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentDtoImplCopyWith<$Res>
    implements $PaymentDtoCopyWith<$Res> {
  factory _$$PaymentDtoImplCopyWith(
          _$PaymentDtoImpl value, $Res Function(_$PaymentDtoImpl) then) =
      __$$PaymentDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'qr_image_link') String? qr_image_link,
      @JsonKey(name: 'order_id') String? order_id,
      @JsonKey(name: 'transfer_amount') int? transfer_amount,
      @JsonKey(name: 'transfer_currency') String? transfer_currency});
}

/// @nodoc
class __$$PaymentDtoImplCopyWithImpl<$Res>
    extends _$PaymentDtoCopyWithImpl<$Res, _$PaymentDtoImpl>
    implements _$$PaymentDtoImplCopyWith<$Res> {
  __$$PaymentDtoImplCopyWithImpl(
      _$PaymentDtoImpl _value, $Res Function(_$PaymentDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qr_image_link = freezed,
    Object? order_id = freezed,
    Object? transfer_amount = freezed,
    Object? transfer_currency = freezed,
  }) {
    return _then(_$PaymentDtoImpl(
      qr_image_link: freezed == qr_image_link
          ? _value.qr_image_link
          : qr_image_link // ignore: cast_nullable_to_non_nullable
              as String?,
      order_id: freezed == order_id
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as String?,
      transfer_amount: freezed == transfer_amount
          ? _value.transfer_amount
          : transfer_amount // ignore: cast_nullable_to_non_nullable
              as int?,
      transfer_currency: freezed == transfer_currency
          ? _value.transfer_currency
          : transfer_currency // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentDtoImpl implements _PaymentDto {
  _$PaymentDtoImpl(
      {@JsonKey(name: 'qr_image_link') this.qr_image_link,
      @JsonKey(name: 'order_id') this.order_id,
      @JsonKey(name: 'transfer_amount') this.transfer_amount,
      @JsonKey(name: 'transfer_currency') this.transfer_currency});

  factory _$PaymentDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentDtoImplFromJson(json);

  @override
  @JsonKey(name: 'qr_image_link')
  String? qr_image_link;
  @override
  @JsonKey(name: 'order_id')
  String? order_id;
  @override
  @JsonKey(name: 'transfer_amount')
  int? transfer_amount;
  @override
  @JsonKey(name: 'transfer_currency')
  String? transfer_currency;

  @override
  String toString() {
    return 'PaymentDto(qr_image_link: $qr_image_link, order_id: $order_id, transfer_amount: $transfer_amount, transfer_currency: $transfer_currency)';
  }

  /// Create a copy of PaymentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentDtoImplCopyWith<_$PaymentDtoImpl> get copyWith =>
      __$$PaymentDtoImplCopyWithImpl<_$PaymentDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentDtoImplToJson(
      this,
    );
  }
}

abstract class _PaymentDto implements PaymentDto {
  factory _PaymentDto(
          {@JsonKey(name: 'qr_image_link') String? qr_image_link,
          @JsonKey(name: 'order_id') String? order_id,
          @JsonKey(name: 'transfer_amount') int? transfer_amount,
          @JsonKey(name: 'transfer_currency') String? transfer_currency}) =
      _$PaymentDtoImpl;

  factory _PaymentDto.fromJson(Map<String, dynamic> json) =
      _$PaymentDtoImpl.fromJson;

  @override
  @JsonKey(name: 'qr_image_link')
  String? get qr_image_link;
  @JsonKey(name: 'qr_image_link')
  set qr_image_link(String? value);
  @override
  @JsonKey(name: 'order_id')
  String? get order_id;
  @JsonKey(name: 'order_id')
  set order_id(String? value);
  @override
  @JsonKey(name: 'transfer_amount')
  int? get transfer_amount;
  @JsonKey(name: 'transfer_amount')
  set transfer_amount(int? value);
  @override
  @JsonKey(name: 'transfer_currency')
  String? get transfer_currency;
  @JsonKey(name: 'transfer_currency')
  set transfer_currency(String? value);

  /// Create a copy of PaymentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentDtoImplCopyWith<_$PaymentDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
