// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SliderState {
  bool get loading => throw _privateConstructorUsedError;

  /// Create a copy of SliderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SliderStateCopyWith<SliderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SliderStateCopyWith<$Res> {
  factory $SliderStateCopyWith(
          SliderState value, $Res Function(SliderState) then) =
      _$SliderStateCopyWithImpl<$Res, SliderState>;
  @useResult
  $Res call({bool loading});
}

/// @nodoc
class _$SliderStateCopyWithImpl<$Res, $Val extends SliderState>
    implements $SliderStateCopyWith<$Res> {
  _$SliderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SliderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SliderStateImplCopyWith<$Res>
    implements $SliderStateCopyWith<$Res> {
  factory _$$SliderStateImplCopyWith(
          _$SliderStateImpl value, $Res Function(_$SliderStateImpl) then) =
      __$$SliderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading});
}

/// @nodoc
class __$$SliderStateImplCopyWithImpl<$Res>
    extends _$SliderStateCopyWithImpl<$Res, _$SliderStateImpl>
    implements _$$SliderStateImplCopyWith<$Res> {
  __$$SliderStateImplCopyWithImpl(
      _$SliderStateImpl _value, $Res Function(_$SliderStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SliderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
  }) {
    return _then(_$SliderStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SliderStateImpl implements _SliderState {
  const _$SliderStateImpl({this.loading = false});

  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'SliderState(loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SliderStateImpl &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading);

  /// Create a copy of SliderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SliderStateImplCopyWith<_$SliderStateImpl> get copyWith =>
      __$$SliderStateImplCopyWithImpl<_$SliderStateImpl>(this, _$identity);
}

abstract class _SliderState implements SliderState {
  const factory _SliderState({final bool loading}) = _$SliderStateImpl;

  @override
  bool get loading;

  /// Create a copy of SliderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SliderStateImplCopyWith<_$SliderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
