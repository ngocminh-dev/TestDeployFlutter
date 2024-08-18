import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_gen_result_state.freezed.dart';

@freezed
class AIGenResultState with _$AIGenResultState {
  const factory AIGenResultState({
    @Default([]) List<String> images,
    @Default(0) int currentIndex,
  }) = _AIGenResultState;
}
