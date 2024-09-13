// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'in_app_purchase_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InAppPurchaseState {
  List<ProductDetails> get products => throw _privateConstructorUsedError;
  List<PurchaseDetails> get purchases => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get pendingPurchase => throw _privateConstructorUsedError;

  /// Create a copy of InAppPurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InAppPurchaseStateCopyWith<InAppPurchaseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InAppPurchaseStateCopyWith<$Res> {
  factory $InAppPurchaseStateCopyWith(
          InAppPurchaseState value, $Res Function(InAppPurchaseState) then) =
      _$InAppPurchaseStateCopyWithImpl<$Res, InAppPurchaseState>;
  @useResult
  $Res call(
      {List<ProductDetails> products,
      List<PurchaseDetails> purchases,
      bool isAvailable,
      bool loading,
      bool pendingPurchase});
}

/// @nodoc
class _$InAppPurchaseStateCopyWithImpl<$Res, $Val extends InAppPurchaseState>
    implements $InAppPurchaseStateCopyWith<$Res> {
  _$InAppPurchaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InAppPurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? purchases = null,
    Object? isAvailable = null,
    Object? loading = null,
    Object? pendingPurchase = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDetails>,
      purchases: null == purchases
          ? _value.purchases
          : purchases // ignore: cast_nullable_to_non_nullable
              as List<PurchaseDetails>,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      pendingPurchase: null == pendingPurchase
          ? _value.pendingPurchase
          : pendingPurchase // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InAppPurchaseStateImplCopyWith<$Res>
    implements $InAppPurchaseStateCopyWith<$Res> {
  factory _$$InAppPurchaseStateImplCopyWith(_$InAppPurchaseStateImpl value,
          $Res Function(_$InAppPurchaseStateImpl) then) =
      __$$InAppPurchaseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ProductDetails> products,
      List<PurchaseDetails> purchases,
      bool isAvailable,
      bool loading,
      bool pendingPurchase});
}

/// @nodoc
class __$$InAppPurchaseStateImplCopyWithImpl<$Res>
    extends _$InAppPurchaseStateCopyWithImpl<$Res, _$InAppPurchaseStateImpl>
    implements _$$InAppPurchaseStateImplCopyWith<$Res> {
  __$$InAppPurchaseStateImplCopyWithImpl(_$InAppPurchaseStateImpl _value,
      $Res Function(_$InAppPurchaseStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of InAppPurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? purchases = null,
    Object? isAvailable = null,
    Object? loading = null,
    Object? pendingPurchase = null,
  }) {
    return _then(_$InAppPurchaseStateImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDetails>,
      purchases: null == purchases
          ? _value._purchases
          : purchases // ignore: cast_nullable_to_non_nullable
              as List<PurchaseDetails>,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      pendingPurchase: null == pendingPurchase
          ? _value.pendingPurchase
          : pendingPurchase // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InAppPurchaseStateImpl implements _InAppPurchaseState {
  const _$InAppPurchaseStateImpl(
      {final List<ProductDetails> products = const [],
      final List<PurchaseDetails> purchases = const [],
      this.isAvailable = true,
      this.loading = false,
      this.pendingPurchase = false})
      : _products = products,
        _purchases = purchases;

  final List<ProductDetails> _products;
  @override
  @JsonKey()
  List<ProductDetails> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<PurchaseDetails> _purchases;
  @override
  @JsonKey()
  List<PurchaseDetails> get purchases {
    if (_purchases is EqualUnmodifiableListView) return _purchases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_purchases);
  }

  @override
  @JsonKey()
  final bool isAvailable;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool pendingPurchase;

  @override
  String toString() {
    return 'InAppPurchaseState(products: $products, purchases: $purchases, isAvailable: $isAvailable, loading: $loading, pendingPurchase: $pendingPurchase)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InAppPurchaseStateImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other._purchases, _purchases) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.pendingPurchase, pendingPurchase) ||
                other.pendingPurchase == pendingPurchase));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_purchases),
      isAvailable,
      loading,
      pendingPurchase);

  /// Create a copy of InAppPurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InAppPurchaseStateImplCopyWith<_$InAppPurchaseStateImpl> get copyWith =>
      __$$InAppPurchaseStateImplCopyWithImpl<_$InAppPurchaseStateImpl>(
          this, _$identity);
}

abstract class _InAppPurchaseState implements InAppPurchaseState {
  const factory _InAppPurchaseState(
      {final List<ProductDetails> products,
      final List<PurchaseDetails> purchases,
      final bool isAvailable,
      final bool loading,
      final bool pendingPurchase}) = _$InAppPurchaseStateImpl;

  @override
  List<ProductDetails> get products;
  @override
  List<PurchaseDetails> get purchases;
  @override
  bool get isAvailable;
  @override
  bool get loading;
  @override
  bool get pendingPurchase;

  /// Create a copy of InAppPurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InAppPurchaseStateImplCopyWith<_$InAppPurchaseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
