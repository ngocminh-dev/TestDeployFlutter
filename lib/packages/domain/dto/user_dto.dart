import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@unfreezed
class UserDto with _$UserDto {
  factory UserDto({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'free_clicks') int? freeClicks,
    @JsonKey(name: 'premium_clicks') int? premiumClicks,
    @JsonKey(name: 'is_anonymous') @Default(true) bool isAnonymous,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}
