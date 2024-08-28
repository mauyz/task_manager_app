import 'package:task_manager_app/data/datasource/task_datasource.dart';
import 'package:task_manager_app/data/datasource/task_datasource_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_datasource_provider.g.dart';

@riverpod
TaskDatabase taskDatabase(TaskDatabaseRef ref) {
  return TaskDatabaseImpl();
}
