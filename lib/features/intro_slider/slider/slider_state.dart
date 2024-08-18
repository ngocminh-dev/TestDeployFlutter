import 'package:freezed_annotation/freezed_annotation.dart';

part 'slider_state.freezed.dart';

@freezed
class SliderState with _$SliderState {
  const factory SliderState({
    @Default(false) bool loading,
}) = _SliderState;
}