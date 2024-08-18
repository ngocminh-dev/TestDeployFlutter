import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_status_dto.freezed.dart';
part 'payment_status_dto.g.dart';

@unfreezed
class PaymentStatusDto with _$PaymentStatusDto {
  factory PaymentStatusDto({
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'message') String? message,
  }) = _PaymentStatusDto;

  factory PaymentStatusDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentStatusDtoFromJson(json);
}

