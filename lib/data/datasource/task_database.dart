import 'package:task_manager_app/data/entity/task_entity.dart';

abstract class TaskDatabase {
  Future<TaskListEntity> getAllTasks();
  Future<TaskEntity> insertTask(final TaskEntity taskEntity);
  Future<void> updateTask(final TaskEntity taskEntity);
  Future<void> deleteTask(final int taskId);
}