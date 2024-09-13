// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PricingDtoImpl _$$PricingDtoImplFromJson(Map<String, dynamic> json) =>
    _$PricingDtoImpl(
      step: (json['step'] as num?)?.toInt(),
      price_per_step: (json['price_per_step'] as num?)?.toInt(),
      country_code: json['country_code'] as String?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$$PricingDtoImplToJson(_$PricingDtoImpl instance) =>
    <String, dynamic>{
      'step': instance.step,
      'price_per_step': instance.price_per_step,
      'country_code': instance.country_code,
      'currency': instance.currency,
    };
