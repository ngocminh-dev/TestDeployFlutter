import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_dto.freezed.dart';
part 'payment_dto.g.dart';

@unfreezed
class PaymentDto with _$PaymentDto {
  factory PaymentDto({
    @JsonKey(name: 'qr_image_link') String? qr_image_link,
    @JsonKey(name: 'order_id') String? order_id,
    @JsonKey(name: 'transfer_amount') int? transfer_amount,
    @JsonKey(name: 'transfer_currency') String? transfer_currency,
  }) = _PaymentDto;

  factory PaymentDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentDtoFromJson(json);
}
