import 'package:freezed_annotation/freezed_annotation.dart';

part 'pricing_dto.freezed.dart';
part 'pricing_dto.g.dart';

@unfreezed
class PricingDto with _$PricingDto {
  factory PricingDto({
    @JsonKey(name: 'step') int? step,
    @JsonKey(name: 'price_per_step') int? price_per_step,
    @JsonKey(name: 'country_code') String? country_code,
    @JsonKey(name: 'currency') String? currency,
  }) = _PricingDto;

  factory PricingDto.fromJson(Map<String, dynamic> json) =>
      _$PricingDtoFromJson(json);
}
