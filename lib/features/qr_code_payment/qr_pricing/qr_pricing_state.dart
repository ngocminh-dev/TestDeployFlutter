import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_pricing_state.freezed.dart';

@freezed
class QrPricingState with _$QrPricingState {
  const factory QrPricingState({
    @Default(false) bool loading,
  }) = _QrPricingState;
}
