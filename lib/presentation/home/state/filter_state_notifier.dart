import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_manager_app/core/enum/filter_enum.dart';

part 'filter_state_notifier.g.dart';

@riverpod
class FilterStateNotifier extends _$FilterStateNotifier {
  @override
  FilterEnum build() => FilterEnum.all;

  void update(FilterEnum value) {
    state = value;
  }
}
