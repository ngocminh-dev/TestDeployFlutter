import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../packages/index.dart';

part 'qr_display_state.freezed.dart';

@freezed
class QrDisplayState with _$QrDisplayState {
  const factory QrDisplayState({
    PaymentDto? paymentInfo,
    PaymentStatusDto? status,
  }) = _QrDisplayState;
}
