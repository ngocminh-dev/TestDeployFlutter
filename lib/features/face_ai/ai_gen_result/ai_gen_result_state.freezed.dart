// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_gen_result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AIGenResultState {
  List<String> get images => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;

  /// Create a copy of AIGenResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AIGenResultStateCopyWith<AIGenResultState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AIGenResultStateCopyWith<$Res> {
  factory $AIGenResultStateCopyWith(
          AIGenResultState value, $Res Function(AIGenResultState) then) =
      _$AIGenResultStateCopyWithImpl<$Res, AIGenResultState>;
  @useResult
  $Res call({List<String> images, int currentIndex});
}

/// @nodoc
class _$AIGenResultStateCopyWithImpl<$Res, $Val extends AIGenResultState>
    implements $AIGenResultStateCopyWith<$Res> {
  _$AIGenResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AIGenResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
    Object? currentIndex = null,
  }) {
    return _then(_value.copyWith(
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AIGenResultStateImplCopyWith<$Res>
    implements $AIGenResultStateCopyWith<$Res> {
  factory _$$AIGenResultStateImplCopyWith(_$AIGenResultStateImpl value,
          $Res Function(_$AIGenResultStateImpl) then) =
      __$$AIGenResultStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> images, int currentIndex});
}

/// @nodoc
class __$$AIGenResultStateImplCopyWithImpl<$Res>
    extends _$AIGenResultStateCopyWithImpl<$Res, _$AIGenResultStateImpl>
    implements _$$AIGenResultStateImplCopyWith<$Res> {
  __$$AIGenResultStateImplCopyWithImpl(_$AIGenResultStateImpl _value,
      $Res Function(_$AIGenResultStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AIGenResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
    Object? currentIndex = null,
  }) {
    return _then(_$AIGenResultStateImpl(
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AIGenResultStateImpl implements _AIGenResultState {
  const _$AIGenResultStateImpl(
      {final List<String> images = const [], this.currentIndex = 0})
      : _images = images;

  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey()
  final int currentIndex;

  @override
  String toString() {
    return 'AIGenResultState(images: $images, currentIndex: $currentIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AIGenResultStateImpl &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_images), currentIndex);

  /// Create a copy of AIGenResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AIGenResultStateImplCopyWith<_$AIGenResultStateImpl> get copyWith =>
      __$$AIGenResultStateImplCopyWithImpl<_$AIGenResultStateImpl>(
          this, _$identity);
}

abstract class _AIGenResultState implements AIGenResultState {
  const factory _AIGenResultState(
      {final List<String> images,
      final int currentIndex}) = _$AIGenResultStateImpl;

  @override
  List<String> get images;
  @override
  int get currentIndex;

  /// Create a copy of AIGenResultState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AIGenResultStateImplCopyWith<_$AIGenResultStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
