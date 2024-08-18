import 'package:freezed_annotation/freezed_annotation.dart';

part 'trait_dto.freezed.dart';
part 'trait_dto.g.dart';

@unfreezed
class TraitDto with _$TraitDto {
  factory TraitDto({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'category_id') String? categoryId,
    @Default(false) bool selected,
  }) = _TraitDto;

  factory TraitDto.fromJson(Map<String, dynamic> json) =>
      _$TraitDtoFromJson(json);
}
