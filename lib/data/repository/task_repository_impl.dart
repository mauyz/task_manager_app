import 'package:task_manager_app/data/datasource/task_datasource.dart';
import 'package:task_manager_app/data/mapper/task_mapper.dart';
import 'package:task_manager_app/domain/model/task.dart';
import 'package:task_manager_app/domain/repository/task_repository.dart';

/// Implementation of the [TaskRepository] interface that interacts with the data layer.
///
/// [TaskRepositoryImpl] acts as a bridge between the domain layer and the data layer,
/// using the [TaskDatasource] to perform CRUD operations on tasks.
class TaskRepositoryImpl implements TaskRepository {
  final TaskDatasource taskDatasource;

  TaskRepositoryImpl(this.taskDatasource);

  /// Retrieves a list of all tasks from the data source.
  @override
  Future<List<Task>> getTaskList() {
    return taskDatasource.getAllTasks().then(
      (list) {
        return list.map((e) => TaskMapper.entityToModel(e)).toList();
      },
    );
  }

  /// Adds a new task to the data source.
  @override
  Future<Task> addTask(Task task) {
    return taskDatasource
        .insertTask(TaskMapper.modelToNewEntity(task))
        .then(TaskMapper.entityToModel);
  }

  /// Updates an existing task in the data source.
  @override
  Future<void> updateTask(Task task) {
    return taskDatasource.updateTask(TaskMapper.modelToEntity(task));
  }

  /// Deletes a task from the data source by its ID.
  @override
  Future<void> deleteTask(int taskId) {
    return taskDatasource.deleteTask(taskId);
  }
}
