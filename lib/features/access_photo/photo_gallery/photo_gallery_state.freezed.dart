// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_gallery_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhotoGalleryState {
  List<AssetEntity> get allAssets => throw _privateConstructorUsedError;
  List<AssetEntity> get faceAssets => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;

  /// Create a copy of PhotoGalleryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotoGalleryStateCopyWith<PhotoGalleryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoGalleryStateCopyWith<$Res> {
  factory $PhotoGalleryStateCopyWith(
          PhotoGalleryState value, $Res Function(PhotoGalleryState) then) =
      _$PhotoGalleryStateCopyWithImpl<$Res, PhotoGalleryState>;
  @useResult
  $Res call(
      {List<AssetEntity> allAssets,
      List<AssetEntity> faceAssets,
      bool loading,
      int currentIndex,
      double progress});
}

/// @nodoc
class _$PhotoGalleryStateCopyWithImpl<$Res, $Val extends PhotoGalleryState>
    implements $PhotoGalleryStateCopyWith<$Res> {
  _$PhotoGalleryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotoGalleryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allAssets = null,
    Object? faceAssets = null,
    Object? loading = null,
    Object? currentIndex = null,
    Object? progress = null,
  }) {
    return _then(_value.copyWith(
      allAssets: null == allAssets
          ? _value.allAssets
          : allAssets // ignore: cast_nullable_to_non_nullable
              as List<AssetEntity>,
      faceAssets: null == faceAssets
          ? _value.faceAssets
          : faceAssets // ignore: cast_nullable_to_non_nullable
              as List<AssetEntity>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotoGalleryStateImplCopyWith<$Res>
    implements $PhotoGalleryStateCopyWith<$Res> {
  factory _$$PhotoGalleryStateImplCopyWith(_$PhotoGalleryStateImpl value,
          $Res Function(_$PhotoGalleryStateImpl) then) =
      __$$PhotoGalleryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AssetEntity> allAssets,
      List<AssetEntity> faceAssets,
      bool loading,
      int currentIndex,
      double progress});
}

/// @nodoc
class __$$PhotoGalleryStateImplCopyWithImpl<$Res>
    extends _$PhotoGalleryStateCopyWithImpl<$Res, _$PhotoGalleryStateImpl>
    implements _$$PhotoGalleryStateImplCopyWith<$Res> {
  __$$PhotoGalleryStateImplCopyWithImpl(_$PhotoGalleryStateImpl _value,
      $Res Function(_$PhotoGalleryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoGalleryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allAssets = null,
    Object? faceAssets = null,
    Object? loading = null,
    Object? currentIndex = null,
    Object? progress = null,
  }) {
    return _then(_$PhotoGalleryStateImpl(
      allAssets: null == allAssets
          ? _value._allAssets
          : allAssets // ignore: cast_nullable_to_non_nullable
              as List<AssetEntity>,
      faceAssets: null == faceAssets
          ? _value._faceAssets
          : faceAssets // ignore: cast_nullable_to_non_nullable
              as List<AssetEntity>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$PhotoGalleryStateImpl implements _PhotoGalleryState {
  const _$PhotoGalleryStateImpl(
      {final List<AssetEntity> allAssets = const [],
      final List<AssetEntity> faceAssets = const [],
      this.loading = false,
      this.currentIndex = 0,
      this.progress = 0})
      : _allAssets = allAssets,
        _faceAssets = faceAssets;

  final List<AssetEntity> _allAssets;
  @override
  @JsonKey()
  List<AssetEntity> get allAssets {
    if (_allAssets is EqualUnmodifiableListView) return _allAssets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allAssets);
  }

  final List<AssetEntity> _faceAssets;
  @override
  @JsonKey()
  List<AssetEntity> get faceAssets {
    if (_faceAssets is EqualUnmodifiableListView) return _faceAssets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_faceAssets);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final int currentIndex;
  @override
  @JsonKey()
  final double progress;

  @override
  String toString() {
    return 'PhotoGalleryState(allAssets: $allAssets, faceAssets: $faceAssets, loading: $loading, currentIndex: $currentIndex, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoGalleryStateImpl &&
            const DeepCollectionEquality()
                .equals(other._allAssets, _allAssets) &&
            const DeepCollectionEquality()
                .equals(other._faceAssets, _faceAssets) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allAssets),
      const DeepCollectionEquality().hash(_faceAssets),
      loading,
      currentIndex,
      progress);

  /// Create a copy of PhotoGalleryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoGalleryStateImplCopyWith<_$PhotoGalleryStateImpl> get copyWith =>
      __$$PhotoGalleryStateImplCopyWithImpl<_$PhotoGalleryStateImpl>(
          this, _$identity);
}

abstract class _PhotoGalleryState implements PhotoGalleryState {
  const factory _PhotoGalleryState(
      {final List<AssetEntity> allAssets,
      final List<AssetEntity> faceAssets,
      final bool loading,
      final int currentIndex,
      final double progress}) = _$PhotoGalleryStateImpl;

  @override
  List<AssetEntity> get allAssets;
  @override
  List<AssetEntity> get faceAssets;
  @override
  bool get loading;
  @override
  int get currentIndex;
  @override
  double get progress;

  /// Create a copy of PhotoGalleryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotoGalleryStateImplCopyWith<_$PhotoGalleryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
