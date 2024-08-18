import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_gen_state.freezed.dart';

@freezed
class ImageGenState with _$ImageGenState {
  const factory ImageGenState({
    @Default(false) bool loading,
    int? selectedIndex,
    @Default(0)int currentPage,
    @Default([]) List<String> images,
    @Default(false) bool generateEnabled,
}) = _ImageGenState;
}