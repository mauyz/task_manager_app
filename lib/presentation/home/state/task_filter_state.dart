import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_manager_app/core/enum/filter_enum.dart';

part 'task_filter_state.g.dart';

@riverpod
class TaskFilterState extends _$TaskFilterState {
  @override
  FilterEnum build() => FilterEnum.all;

  void update(FilterEnum value) {
    state = value;
  }
}
