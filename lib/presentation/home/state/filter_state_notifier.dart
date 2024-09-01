import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_manager_app/core/enum/filter_enum.dart';

part 'filter_state_notifier.g.dart';

/// A [Riverpod] state notifier that manages the current filter state for task lists.
@riverpod
class FilterStateNotifier extends _$FilterStateNotifier {
  @override
  FilterEnum build() => FilterEnum.all;

  /// Updates the current filter state.
  void update(FilterEnum value) {
    state = value;
  }
}
