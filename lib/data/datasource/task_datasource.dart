import 'package:task_manager_app/data/entity/task_entity.dart';

/// Abstract class that defines the data source operations for managing tasks.
abstract class TaskDatasource {
  /// Retrieves all tasks from the data source.
  ///
  /// Returns a [TaskListEntity] containing the list of all tasks.
  Future<TaskListEntity> getAllTasks();

  /// Inserts a new task into the data source.
  ///
  /// Takes a [TaskEntity] as input and returns the newly inserted [TaskEntity].
  Future<TaskEntity> insertTask(final TaskEntity taskEntity);

  /// Updates an existing task in the data source.
  ///
  /// Takes a [TaskEntity] as input and performs the update operation.
  Future<void> updateTask(final TaskEntity taskEntity);

  /// Deletes a task from the data source by its ID.
  ///
  /// Takes an [int] representing the task's ID and deletes the corresponding task.
  Future<void> deleteTask(final int taskId);
}