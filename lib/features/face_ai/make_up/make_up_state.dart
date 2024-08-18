import 'package:freezed_annotation/freezed_annotation.dart';

part 'make_up_state.freezed.dart';

@freezed
class MakeUpState with _$MakeUpState {
  const factory MakeUpState({
    @Default(false) bool loading,
    int? selectedIndex,
    @Default(0)int currentPage,
    @Default([]) List<String> images,
    @Default(false) bool generateEnabled,
  }) = _MakeUpState;
}