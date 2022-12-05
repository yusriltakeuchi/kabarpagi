import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_state.freezed.dart';

@freezed
abstract class ListState<T> with _$ListState<T> {
  factory ListState({
    required List<T> items,
    @Default(1) int page,
    @Default(false) bool isLoading,
    @Default(false) bool reachedMax
  }) = _ListState;

  const ListState._();
}