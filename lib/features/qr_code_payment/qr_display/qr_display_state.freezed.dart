// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_display_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QrDisplayState {
  PaymentDto? get paymentInfo => throw _privateConstructorUsedError;
  PaymentStatusDto? get status => throw _privateConstructorUsedError;

  /// Create a copy of QrDisplayState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QrDisplayStateCopyWith<QrDisplayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrDisplayStateCopyWith<$Res> {
  factory $QrDisplayStateCopyWith(
          QrDisplayState value, $Res Function(QrDisplayState) then) =
      _$QrDisplayStateCopyWithImpl<$Res, QrDisplayState>;
  @useResult
  $Res call({PaymentDto? paymentInfo, PaymentStatusDto? status});

  $PaymentDtoCopyWith<$Res>? get paymentInfo;
  $PaymentStatusDtoCopyWith<$Res>? get status;
}

/// @nodoc
class _$QrDisplayStateCopyWithImpl<$Res, $Val extends QrDisplayState>
    implements $QrDisplayStateCopyWith<$Res> {
  _$QrDisplayStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QrDisplayState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentInfo = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      paymentInfo: freezed == paymentInfo
          ? _value.paymentInfo
          : paymentInfo // ignore: cast_nullable_to_non_nullable
              as PaymentDto?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PaymentStatusDto?,
    ) as $Val);
  }

  /// Create a copy of QrDisplayState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentDtoCopyWith<$Res>? get paymentInfo {
    if (_value.paymentInfo == null) {
      return null;
    }

    return $PaymentDtoCopyWith<$Res>(_value.paymentInfo!, (value) {
      return _then(_value.copyWith(paymentInfo: value) as $Val);
    });
  }

  /// Create a copy of QrDisplayState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentStatusDtoCopyWith<$Res>? get status {
    if (_value.status == null) {
      return null;
    }

    return $PaymentStatusDtoCopyWith<$Res>(_value.status!, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QrDisplayStateImplCopyWith<$Res>
    implements $QrDisplayStateCopyWith<$Res> {
  factory _$$QrDisplayStateImplCopyWith(_$QrDisplayStateImpl value,
          $Res Function(_$QrDisplayStateImpl) then) =
      __$$QrDisplayStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaymentDto? paymentInfo, PaymentStatusDto? status});

  @override
  $PaymentDtoCopyWith<$Res>? get paymentInfo;
  @override
  $PaymentStatusDtoCopyWith<$Res>? get status;
}

/// @nodoc
class __$$QrDisplayStateImplCopyWithImpl<$Res>
    extends _$QrDisplayStateCopyWithImpl<$Res, _$QrDisplayStateImpl>
    implements _$$QrDisplayStateImplCopyWith<$Res> {
  __$$QrDisplayStateImplCopyWithImpl(
      _$QrDisplayStateImpl _value, $Res Function(_$QrDisplayStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of QrDisplayState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentInfo = freezed,
    Object? status = freezed,
  }) {
    return _then(_$QrDisplayStateImpl(
      paymentInfo: freezed == paymentInfo
          ? _value.paymentInfo
          : paymentInfo // ignore: cast_nullable_to_non_nullable
              as PaymentDto?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PaymentStatusDto?,
    ));
  }
}

/// @nodoc

class _$QrDisplayStateImpl implements _QrDisplayState {
  const _$QrDisplayStateImpl({this.paymentInfo, this.status});

  @override
  final PaymentDto? paymentInfo;
  @override
  final PaymentStatusDto? status;

  @override
  String toString() {
    return 'QrDisplayState(paymentInfo: $paymentInfo, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrDisplayStateImpl &&
            (identical(other.paymentInfo, paymentInfo) ||
                other.paymentInfo == paymentInfo) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentInfo, status);

  /// Create a copy of QrDisplayState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QrDisplayStateImplCopyWith<_$QrDisplayStateImpl> get copyWith =>
      __$$QrDisplayStateImplCopyWithImpl<_$QrDisplayStateImpl>(
          this, _$identity);
}

abstract class _QrDisplayState implements QrDisplayState {
  const factory _QrDisplayState(
      {final PaymentDto? paymentInfo,
      final PaymentStatusDto? status}) = _$QrDisplayStateImpl;

  @override
  PaymentDto? get paymentInfo;
  @override
  PaymentStatusDto? get status;

  /// Create a copy of QrDisplayState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QrDisplayStateImplCopyWith<_$QrDisplayStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
