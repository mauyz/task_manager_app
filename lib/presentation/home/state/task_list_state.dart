import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_manager_app/data/repository/task_repository_provider.dart';
import 'package:task_manager_app/domain/model/task.dart';

part 'task_list_state.g.dart';

@riverpod
class TaskListState extends _$TaskListState {
  @override
  Future<List<Task>> build() {
    return initData();
  }

  Future<List<Task>> initData() async {
    try {
      return ref.read(taskRepositoryProvider).getTaskList();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future refreshData() async {
    try {
      state = const AsyncLoading();
      final data = await ref.read(taskRepositoryProvider).getTaskList();
      state = AsyncData(data);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future addTask(final Task task) async {
    try {
      final result = await ref.read(taskRepositoryProvider).addTask(task);
      final previousState = await future;
      state = AsyncData([...previousState, result]);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future testAddTask() async {
    try {
      final id = Random().nextInt(100);
      final task = Task(
        id: id,
        title: "title $id",
        description: "description",
        isCompleted: id % 2 == 0,
      );
      //final result = await ref.read(taskRepositoryProvider).addTask(task);
      final previousState = await future;
      state = AsyncData([...previousState, task]);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future updateTask(final Task task) async {
    try {
      await ref.read(taskRepositoryProvider).updateTask(task);
      final previousState = await future;
      state = AsyncData([
        for (final value in previousState)
          if (value.id == task.id) task else value,
      ]);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future deleteTask(final int taskId) async {
    try {
      await ref.read(taskRepositoryProvider).deleteTask(taskId);
      final previousState = await future;
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
