// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'make_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MakeUpState {
  bool get loading => throw _privateConstructorUsedError;
  int? get selectedIndex => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  bool get generateEnabled => throw _privateConstructorUsedError;

  /// Create a copy of MakeUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MakeUpStateCopyWith<MakeUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MakeUpStateCopyWith<$Res> {
  factory $MakeUpStateCopyWith(
          MakeUpState value, $Res Function(MakeUpState) then) =
      _$MakeUpStateCopyWithImpl<$Res, MakeUpState>;
  @useResult
  $Res call(
      {bool loading,
      int? selectedIndex,
      int currentPage,
      List<String> images,
      bool generateEnabled});
}

/// @nodoc
class _$MakeUpStateCopyWithImpl<$Res, $Val extends MakeUpState>
    implements $MakeUpStateCopyWith<$Res> {
  _$MakeUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MakeUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? selectedIndex = freezed,
    Object? currentPage = null,
    Object? images = null,
    Object? generateEnabled = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedIndex: freezed == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      generateEnabled: null == generateEnabled
          ? _value.generateEnabled
          : generateEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MakeUpStateImplCopyWith<$Res>
    implements $MakeUpStateCopyWith<$Res> {
  factory _$$MakeUpStateImplCopyWith(
          _$MakeUpStateImpl value, $Res Function(_$MakeUpStateImpl) then) =
      __$$MakeUpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      int? selectedIndex,
      int currentPage,
      List<String> images,
      bool generateEnabled});
}

/// @nodoc
class __$$MakeUpStateImplCopyWithImpl<$Res>
    extends _$MakeUpStateCopyWithImpl<$Res, _$MakeUpStateImpl>
    implements _$$MakeUpStateImplCopyWith<$Res> {
  __$$MakeUpStateImplCopyWithImpl(
      _$MakeUpStateImpl _value, $Res Function(_$MakeUpStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MakeUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? selectedIndex = freezed,
    Object? currentPage = null,
    Object? images = null,
    Object? generateEnabled = null,
  }) {
    return _then(_$MakeUpStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedIndex: freezed == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      generateEnabled: null == generateEnabled
          ? _value.generateEnabled
          : generateEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MakeUpStateImpl implements _MakeUpState {
  const _$MakeUpStateImpl(
      {this.loading = false,
      this.selectedIndex,
      this.currentPage = 0,
      final List<String> images = const [],
      this.generateEnabled = false})
      : _images = images;

  @override
  @JsonKey()
  final bool loading;
  @override
  final int? selectedIndex;
  @override
  @JsonKey()
  final int currentPage;
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
  final bool generateEnabled;

  @override
  String toString() {
    return 'MakeUpState(loading: $loading, selectedIndex: $selectedIndex, currentPage: $currentPage, images: $images, generateEnabled: $generateEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MakeUpStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.generateEnabled, generateEnabled) ||
                other.generateEnabled == generateEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      selectedIndex,
      currentPage,
      const DeepCollectionEquality().hash(_images),
      generateEnabled);

  /// Create a copy of MakeUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MakeUpStateImplCopyWith<_$MakeUpStateImpl> get copyWith =>
      __$$MakeUpStateImplCopyWithImpl<_$MakeUpStateImpl>(this, _$identity);
}

abstract class _MakeUpState implements MakeUpState {
  const factory _MakeUpState(
      {final bool loading,
      final int? selectedIndex,
      final int currentPage,
      final List<String> images,
      final bool generateEnabled}) = _$MakeUpStateImpl;

  @override
  bool get loading;
  @override
  int? get selectedIndex;
  @override
  int get currentPage;
  @override
  List<String> get images;
  @override
  bool get generateEnabled;

  /// Create a copy of MakeUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MakeUpStateImplCopyWith<_$MakeUpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
