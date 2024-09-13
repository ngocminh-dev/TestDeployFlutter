// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'magic_brush_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MagicBrushState {
  bool get loading => throw _privateConstructorUsedError;
  String? get urlEnhance => throw _privateConstructorUsedError;
  bool get hasFace => throw _privateConstructorUsedError;

  /// Create a copy of MagicBrushState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MagicBrushStateCopyWith<MagicBrushState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MagicBrushStateCopyWith<$Res> {
  factory $MagicBrushStateCopyWith(
          MagicBrushState value, $Res Function(MagicBrushState) then) =
      _$MagicBrushStateCopyWithImpl<$Res, MagicBrushState>;
  @useResult
  $Res call({bool loading, String? urlEnhance, bool hasFace});
}

/// @nodoc
class _$MagicBrushStateCopyWithImpl<$Res, $Val extends MagicBrushState>
    implements $MagicBrushStateCopyWith<$Res> {
  _$MagicBrushStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MagicBrushState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? urlEnhance = freezed,
    Object? hasFace = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      urlEnhance: freezed == urlEnhance
          ? _value.urlEnhance
          : urlEnhance // ignore: cast_nullable_to_non_nullable
              as String?,
      hasFace: null == hasFace
          ? _value.hasFace
          : hasFace // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MagicBrushStateImplCopyWith<$Res>
    implements $MagicBrushStateCopyWith<$Res> {
  factory _$$MagicBrushStateImplCopyWith(_$MagicBrushStateImpl value,
          $Res Function(_$MagicBrushStateImpl) then) =
      __$$MagicBrushStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, String? urlEnhance, bool hasFace});
}

/// @nodoc
class __$$MagicBrushStateImplCopyWithImpl<$Res>
    extends _$MagicBrushStateCopyWithImpl<$Res, _$MagicBrushStateImpl>
    implements _$$MagicBrushStateImplCopyWith<$Res> {
  __$$MagicBrushStateImplCopyWithImpl(
      _$MagicBrushStateImpl _value, $Res Function(_$MagicBrushStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MagicBrushState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? urlEnhance = freezed,
    Object? hasFace = null,
  }) {
    return _then(_$MagicBrushStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      urlEnhance: freezed == urlEnhance
          ? _value.urlEnhance
          : urlEnhance // ignore: cast_nullable_to_non_nullable
              as String?,
      hasFace: null == hasFace
          ? _value.hasFace
          : hasFace // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MagicBrushStateImpl implements _MagicBrushState {
  const _$MagicBrushStateImpl(
      {this.loading = false, this.urlEnhance, this.hasFace = true});

  @override
  @JsonKey()
  final bool loading;
  @override
  final String? urlEnhance;
  @override
  @JsonKey()
  final bool hasFace;

  @override
  String toString() {
    return 'MagicBrushState(loading: $loading, urlEnhance: $urlEnhance, hasFace: $hasFace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MagicBrushStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.urlEnhance, urlEnhance) ||
                other.urlEnhance == urlEnhance) &&
            (identical(other.hasFace, hasFace) || other.hasFace == hasFace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, urlEnhance, hasFace);

  /// Create a copy of MagicBrushState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MagicBrushStateImplCopyWith<_$MagicBrushStateImpl> get copyWith =>
      __$$MagicBrushStateImplCopyWithImpl<_$MagicBrushStateImpl>(
          this, _$identity);
}

abstract class _MagicBrushState implements MagicBrushState {
  const factory _MagicBrushState(
      {final bool loading,
      final String? urlEnhance,
      final bool hasFace}) = _$MagicBrushStateImpl;

  @override
  bool get loading;
  @override
  String? get urlEnhance;
  @override
  bool get hasFace;

  /// Create a copy of MagicBrushState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MagicBrushStateImplCopyWith<_$MagicBrushStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
