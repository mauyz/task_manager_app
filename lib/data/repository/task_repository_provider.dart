import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_manager_app/data/datasource/task_datasource_provider.dart';
import 'package:task_manager_app/data/repository/task_repository_impl.dart';
import 'package:task_manager_app/domain/repository/task_repository.dart';

part 'task_repository_provider.g.dart';

/// A Riverpod provider for the [TaskRepository] that supplies the implementation.
@riverpod
TaskRepository taskRepository(TaskRepositoryRef ref) {
    final datasource = ref.read(taskDatabaseProvider);
    return TaskRepositoryImpl(datasource);
}