import 'package:task_manager_app/domain/entities/task.dart';

abstract class  TaskRepository {
  Future<List<Task>> getTaskList();
  Future<Task> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(int taskId);
}