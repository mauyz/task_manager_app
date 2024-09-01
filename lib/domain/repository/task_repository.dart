import 'package:task_manager_app/domain/model/task.dart';

/// An abstract class defining the contract for task-related data operations.
abstract class TaskRepository {
  /// Retrieves a list of all tasks.
  Future<List<Task>> getTaskList();

  /// Adds a new task to the data source.
  Future<Task> addTask(final Task task);

  /// Updates an existing task in the data source.
  Future<void> updateTask(final Task task);

  /// Deletes a task from the data source by its ID.
  Future<void> deleteTask(final int taskId);
}
