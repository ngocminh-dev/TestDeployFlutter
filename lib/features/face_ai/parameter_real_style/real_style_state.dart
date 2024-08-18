import '../../../packages/index.dart';

part 'real_style_state.freezed.dart';

@freezed
class RealStyleState with _$RealStyleState {
  const factory RealStyleState({
    @Default(false) bool loading,
    @Default([]) List<CategoryDto> categories,
    @Default(false) bool generateEnable,
  }) = _RealStyleState;
}
