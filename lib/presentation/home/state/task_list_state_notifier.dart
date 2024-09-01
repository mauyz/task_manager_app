import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_manager_app/data/repository/task_repository_provider.dart';
import 'package:task_manager_app/domain/model/task.dart';

part 'task_list_state_notifier.g.dart';

/// A [Riverpod] state notifier that manages the state of the task list.
@riverpod
class TaskListStateNotifier extends _$TaskListStateNotifier {
  @override
  Future<List<Task>> build() {
    return loadTaskList();
  }

  /// Loads the initial list of tasks from the repository.
  Future<List<Task>> loadTaskList() async {
    try {
      return ref.read(taskRepositoryProvider).getTaskList();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  /// Adds a new task to the list.
  Future addTask(final Task task) async {
    try {
      final previousState = await future;
      final result = await ref.read(taskRepositoryProvider).addTask(task);
      state = AsyncData([...previousState, result]);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  /// Updates an existing task in the list.
  Future updateTask(final Task task) async {
    try {
      final previousState = await future;
      await ref.read(taskRepositoryProvider).updateTask(task);
      state = AsyncData([
        for (final value in previousState)
          if (value.id == task.id) task else value
      ]);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  /// Deletes a task from the list.
  Future deleteTask(final int taskId) async {
    try {
      final previousState = await future;
      await ref.read(taskRepositoryProvider).deleteTask(taskId);
      state = AsyncData(previousState
          .where(
            (element) => element.id != taskId,
          )
          .toList());
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
