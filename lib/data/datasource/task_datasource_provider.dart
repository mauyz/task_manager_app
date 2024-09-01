import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_manager_app/data/datasource/task_datasource.dart';
import 'package:task_manager_app/data/datasource/task_datasource_impl.dart';

part 'task_datasource_provider.g.dart';

/// This provider is responsible for instantiating and providing the [TaskDatasourceImpl]
/// instance, which handles the data operations for tasks in the app.
@riverpod
TaskDatasource taskDatabase(TaskDatabaseRef ref) {
  return TaskDatasourceImpl();
}
