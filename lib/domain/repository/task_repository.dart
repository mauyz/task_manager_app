import 'package:task_manager_app/domain/model/task.dart';

abstract class  TaskRepository {
  Future<List<Task>> getTaskList();
  Future<Task> addTask(final Task task);
  Future<void> updateTask(final Task task);
  Future<void> deleteTask(final int taskId);
}