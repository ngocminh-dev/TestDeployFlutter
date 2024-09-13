// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trait_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TraitDtoImpl _$$TraitDtoImplFromJson(Map<String, dynamic> json) =>
    _$TraitDtoImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      categoryId: json['category_id'] as String?,
      selected: json['selected'] as bool? ?? false,
    );

Map<String, dynamic> _$$TraitDtoImplToJson(_$TraitDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category_id': instance.categoryId,
      'selected': instance.selected,
    };
