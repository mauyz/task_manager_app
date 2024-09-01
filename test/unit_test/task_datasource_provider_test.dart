import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager_app/data/datasource/task_datasource.dart';
import 'package:task_manager_app/data/datasource/task_datasource_provider.dart';

import '../mock/datasource/task_datasource_mock.mocks.dart';

void main() {
  ProviderContainer makeProviderContainer(MockTaskDatasource mockDatasource) {
    final container = ProviderContainer(
      overrides: [
        taskDatabaseProvider.overrideWithValue(mockDatasource),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  test('taskDatabase provider should return an instance of TaskDatasource', () {
    // Create a mock instance of TaskDatasource
    final mockTaskDatasource = MockTaskDatasource();

    // create the ProviderContainer with the mock TaskDatasource
    final container = makeProviderContainer(mockTaskDatasource);

    // Read the provider and check if it returns the TaskDatasource instance
    final taskDatasourceProvider = container.read(taskDatabaseProvider);
    expect(taskDatasourceProvider, isA<TaskDatasource>());
  });
}
