import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

part 'in_app_purchase_state.freezed.dart';

@freezed
class InAppPurchaseState with _$InAppPurchaseState {
  const factory InAppPurchaseState({
  @Default([]) List<ProductDetails> products,
  @Default([]) List<PurchaseDetails> purchases,
  @Default(true) bool isAvailable,
    @Default(false) bool loading,
    @Default(false) bool pendingPurchase,
  }) = _InAppPurchaseState;
}
