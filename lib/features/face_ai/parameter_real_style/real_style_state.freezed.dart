// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'real_style_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RealStyleState {
  bool get loading => throw _privateConstructorUsedError;
  List<CategoryDto> get categories => throw _privateConstructorUsedError;
  bool get generateEnable => throw _privateConstructorUsedError;

  /// Create a copy of RealStyleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RealStyleStateCopyWith<RealStyleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealStyleStateCopyWith<$Res> {
  factory $RealStyleStateCopyWith(
          RealStyleState value, $Res Function(RealStyleState) then) =
      _$RealStyleStateCopyWithImpl<$Res, RealStyleState>;
  @useResult
  $Res call({bool loading, List<CategoryDto> categories, bool generateEnable});
}

/// @nodoc
class _$RealStyleStateCopyWithImpl<$Res, $Val extends RealStyleState>
    implements $RealStyleStateCopyWith<$Res> {
  _$RealStyleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RealStyleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? categories = null,
    Object? generateEnable = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDto>,
      generateEnable: null == generateEnable
          ? _value.generateEnable
          : generateEnable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RealStyleStateImplCopyWith<$Res>
    implements $RealStyleStateCopyWith<$Res> {
  factory _$$RealStyleStateImplCopyWith(_$RealStyleStateImpl value,
          $Res Function(_$RealStyleStateImpl) then) =
      __$$RealStyleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, List<CategoryDto> categories, bool generateEnable});
}

/// @nodoc
class __$$RealStyleStateImplCopyWithImpl<$Res>
    extends _$RealStyleStateCopyWithImpl<$Res, _$RealStyleStateImpl>
    implements _$$RealStyleStateImplCopyWith<$Res> {
  __$$RealStyleStateImplCopyWithImpl(
      _$RealStyleStateImpl _value, $Res Function(_$RealStyleStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RealStyleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? categories = null,
    Object? generateEnable = null,
  }) {
    return _then(_$RealStyleStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDto>,
      generateEnable: null == generateEnable
          ? _value.generateEnable
          : generateEnable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RealStyleStateImpl implements _RealStyleState {
  const _$RealStyleStateImpl(
      {this.loading = false,
      final List<CategoryDto> categories = const [],
      this.generateEnable = false})
      : _categories = categories;

  @override
  @JsonKey()
  final bool loading;
  final List<CategoryDto> _categories;
  @override
  @JsonKey()
  List<CategoryDto> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey()
  final bool generateEnable;

  @override
  String toString() {
    return 'RealStyleState(loading: $loading, categories: $categories, generateEnable: $generateEnable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealStyleStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.generateEnable, generateEnable) ||
                other.generateEnable == generateEnable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading,
      const DeepCollectionEquality().hash(_categories), generateEnable);

  /// Create a copy of RealStyleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealStyleStateImplCopyWith<_$RealStyleStateImpl> get copyWith =>
      __$$RealStyleStateImplCopyWithImpl<_$RealStyleStateImpl>(
          this, _$identity);
}

abstract class _RealStyleState implements RealStyleState {
  const factory _RealStyleState(
      {final bool loading,
      final List<CategoryDto> categories,
      final bool generateEnable}) = _$RealStyleStateImpl;

  @override
  bool get loading;
  @override
  List<CategoryDto> get categories;
  @override
  bool get generateEnable;

  /// Create a copy of RealStyleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealStyleStateImplCopyWith<_$RealStyleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
