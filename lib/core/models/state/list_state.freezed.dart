// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListState<T> {
  List<T> get items => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get reachedMax => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListStateCopyWith<T, ListState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListStateCopyWith<T, $Res> {
  factory $ListStateCopyWith(
          ListState<T> value, $Res Function(ListState<T>) then) =
      _$ListStateCopyWithImpl<T, $Res, ListState<T>>;
  @useResult
  $Res call({List<T> items, int page, bool isLoading, bool reachedMax});
}

/// @nodoc
class _$ListStateCopyWithImpl<T, $Res, $Val extends ListState<T>>
    implements $ListStateCopyWith<T, $Res> {
  _$ListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? isLoading = null,
    Object? reachedMax = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      reachedMax: null == reachedMax
          ? _value.reachedMax
          : reachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListStateCopyWith<T, $Res>
    implements $ListStateCopyWith<T, $Res> {
  factory _$$_ListStateCopyWith(
          _$_ListState<T> value, $Res Function(_$_ListState<T>) then) =
      __$$_ListStateCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<T> items, int page, bool isLoading, bool reachedMax});
}

/// @nodoc
class __$$_ListStateCopyWithImpl<T, $Res>
    extends _$ListStateCopyWithImpl<T, $Res, _$_ListState<T>>
    implements _$$_ListStateCopyWith<T, $Res> {
  __$$_ListStateCopyWithImpl(
      _$_ListState<T> _value, $Res Function(_$_ListState<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? isLoading = null,
    Object? reachedMax = null,
  }) {
    return _then(_$_ListState<T>(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      reachedMax: null == reachedMax
          ? _value.reachedMax
          : reachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ListState<T> extends _ListState<T> {
  _$_ListState(
      {required final List<T> items,
      this.page = 1,
      this.isLoading = false,
      this.reachedMax = false})
      : _items = items,
        super._();

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool reachedMax;

  @override
  String toString() {
    return 'ListState<$T>(items: $items, page: $page, isLoading: $isLoading, reachedMax: $reachedMax)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListState<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.reachedMax, reachedMax) ||
                other.reachedMax == reachedMax));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), page, isLoading, reachedMax);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListStateCopyWith<T, _$_ListState<T>> get copyWith =>
      __$$_ListStateCopyWithImpl<T, _$_ListState<T>>(this, _$identity);
}

abstract class _ListState<T> extends ListState<T> {
  factory _ListState(
      {required final List<T> items,
      final int page,
      final bool isLoading,
      final bool reachedMax}) = _$_ListState<T>;
  _ListState._() : super._();

  @override
  List<T> get items;
  @override
  int get page;
  @override
  bool get isLoading;
  @override
  bool get reachedMax;
  @override
  @JsonKey(ignore: true)
  _$$_ListStateCopyWith<T, _$_ListState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
