import 'package:freezed_annotation/freezed_annotation.dart';

part 'magic_brush_state.freezed.dart';

@freezed
class MagicBrushState with _$MagicBrushState {
  const factory MagicBrushState({
    @Default(false) bool loading,
    String? urlEnhance,
    @Default(true) bool hasFace,
  }) = _MagicBrushState;
}
