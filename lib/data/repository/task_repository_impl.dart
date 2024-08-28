import 'package:task_manager_app/data/datasource/task_database.dart';
import 'package:task_manager_app/data/mapper/task_mapper.dart';
import 'package:task_manager_app/domain/model/task.dart';
import 'package:task_manager_app/domain/repository/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskDatabase taskDatabase;

  TaskRepositoryImpl(this.taskDatabase);

  @override
  Future<List<Task>> getTaskList() async {
    final entityList = await taskDatabase.getAllTasks();
    return entityList
        .map(
          (e) => TaskMapper.entityToModel(e),
        )
        .toList();
  }

  @override
  Future<Task> addTask(Task task) async {
    final entity = await taskDatabase.insertTask(
      TaskMapper.modelToNewEntity(task),
    );
    return TaskMapper.entityToModel(entity);
  }

  @override
  Future<void> updateTask(Task task) async {
    await taskDatabase.updateTask(TaskMapper.modelToEntity(task));
  }

  @override
  Future<void> deleteTask(int taskId) async {
    await taskDatabase.deleteTask(taskId);
  }
}
