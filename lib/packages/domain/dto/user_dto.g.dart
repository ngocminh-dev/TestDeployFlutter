// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      id: json['id'] as String?,
      freeClicks: (json['free_clicks'] as num?)?.toInt(),
      premiumClicks: (json['premium_clicks'] as num?)?.toInt(),
      isAnonymous: json['is_anonymous'] as bool? ?? true,
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'free_clicks': instance.freeClicks,
      'premium_clicks': instance.premiumClicks,
      'is_anonymous': instance.isAnonymous,
    };
