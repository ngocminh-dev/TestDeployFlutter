import '../../../packages/index.dart';

part 'face_ai_state.freezed.dart';

@freezed
class FaceAIState with _$FaceAIState {
  const factory FaceAIState({
    @Default(false) bool loading,
    @Default([]) List<CategoryDto> categories,
    int? selectedIndex,
    @Default(0)int currentPage,
    @Default([]) List<String> images,
    @Default(false) bool generateEnableText,
    @Default(false) bool generateEnableImage,
    @Default(false) bool enableAdditions,
  }) = _FaceAIState;
}
