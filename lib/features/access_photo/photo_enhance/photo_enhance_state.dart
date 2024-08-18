import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_enhance_state.freezed.dart';

@freezed
class PhotoEnhanceState with _$PhotoEnhanceState {
  const factory PhotoEnhanceState({
    @Default(false) bool loading,
    String? urlEnhance,
    @Default(true) bool hasFace,
  }) = _PhotoEnhanceState;
}
