// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskListStateNotifierHash() =>
    r'0fd89871a09e0ff87cba9860018e1b1bc6fe2f64';

/// A [Riverpod] state notifier that manages the state of the task list.
///
/// Copied from [TaskListStateNotifier].
@ProviderFor(TaskListStateNotifier)
final taskListStateNotifierProvider = AutoDisposeAsyncNotifierProvider<
    TaskListStateNotifier, List<Task>>.internal(
  TaskListStateNotifier.new,
  name: r'taskListStateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$taskListStateNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TaskListStateNotifier = AutoDisposeAsyncNotifier<List<Task>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
