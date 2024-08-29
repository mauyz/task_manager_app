import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_manager_app/data/repository/task_repository_provider.dart';
import 'package:task_manager_app/domain/model/task.dart';

part 'task_list_state_notifier.g.dart';

@riverpod
class TaskListStateNotifier extends _$TaskListStateNotifier {
  @override
  Future<List<Task>> build() {
    return _loadData();
  }

  Future<List<Task>> _loadData() async {
    try {
      return ref.read(taskRepositoryProvider).getTaskList();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future addTask(final Task task) async {
    try {
      await ref.read(taskRepositoryProvider).addTask(task);
      state = AsyncData(await _loadData());
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future updateTask(final Task task) async {
    try {
      await ref.read(taskRepositoryProvider).updateTask(task);
      state = AsyncData(await _loadData());
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future deleteTask(final int taskId) async {
    try {
      await ref.read(taskRepositoryProvider).deleteTask(taskId);
      state = AsyncData(await _loadData());
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
