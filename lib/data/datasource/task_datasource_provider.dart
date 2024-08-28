import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_manager_app/data/datasource/task_datasource.dart';
import 'package:task_manager_app/data/datasource/task_datasource_impl.dart';

part 'task_datasource_provider.g.dart';

@riverpod
TaskDatasource taskDatabase(TaskDatabaseRef ref) {
  return TaskDatasourceImpl();
}
