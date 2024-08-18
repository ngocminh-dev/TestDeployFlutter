import 'package:freezed_annotation/freezed_annotation.dart';
import '../../packages/index.dart';

part 'click_state.freezed.dart';

@freezed
class ClickState with _$ClickState {
  const factory ClickState({
    int? click,
  }) = _ClickState;
}
