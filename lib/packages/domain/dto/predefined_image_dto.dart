import 'package:freezed_annotation/freezed_annotation.dart';

part 'predefined_image_dto.freezed.dart';
part 'predefined_image_dto.g.dart';

@unfreezed
class PredefinedImageDto with _$PredefinedImageDto {
  factory PredefinedImageDto({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'priority') int? priority,
    @JsonKey(name: 'gender') String? gender,
}) = _PredefinedImageDto;

  factory PredefinedImageDto.fromJson(Map<String, dynamic> json) =>
      _$PredefinedImageDtoFromJson(json);
}