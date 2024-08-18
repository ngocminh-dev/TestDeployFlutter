import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'trait_dto.dart';

part 'category_dto.freezed.dart';

part 'category_dto.g.dart';

@unfreezed
class CategoryDto with _$CategoryDto {
  factory CategoryDto({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'cachable') bool? cachable,
    // @JsonKey(name: 'priority') int? priority,
    // @JsonKey(name: 'mono') @Default(false) bool mono,
    @JsonKey(name: 'traits') @Default([]) List<TraitDto> traits,
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);
}
