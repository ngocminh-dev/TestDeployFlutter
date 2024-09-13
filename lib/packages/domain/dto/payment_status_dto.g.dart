// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_status_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentStatusDtoImpl _$$PaymentStatusDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentStatusDtoImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$PaymentStatusDtoImplToJson(
        _$PaymentStatusDtoImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
