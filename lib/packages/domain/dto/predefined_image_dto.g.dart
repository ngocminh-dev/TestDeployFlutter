// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predefined_image_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PredefinedImageDtoImpl _$$PredefinedImageDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PredefinedImageDtoImpl(
      id: json['id'] as String?,
      url: json['url'] as String?,
      priority: (json['priority'] as num?)?.toInt(),
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$$PredefinedImageDtoImplToJson(
        _$PredefinedImageDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'priority': instance.priority,
      'gender': instance.gender,
    };
