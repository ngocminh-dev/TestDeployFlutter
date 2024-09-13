// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentDtoImpl _$$PaymentDtoImplFromJson(Map<String, dynamic> json) =>
    _$PaymentDtoImpl(
      qr_image_link: json['qr_image_link'] as String?,
      order_id: json['order_id'] as String?,
      transfer_amount: (json['transfer_amount'] as num?)?.toInt(),
      transfer_currency: json['transfer_currency'] as String?,
    );

Map<String, dynamic> _$$PaymentDtoImplToJson(_$PaymentDtoImpl instance) =>
    <String, dynamic>{
      'qr_image_link': instance.qr_image_link,
      'order_id': instance.order_id,
      'transfer_amount': instance.transfer_amount,
      'transfer_currency': instance.transfer_currency,
    };
