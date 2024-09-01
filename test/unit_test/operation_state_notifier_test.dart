import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_manager_app/core/enum/operation_status.dart';
import 'package:task_manager_app/data/repository/task_repository_provider.dart';
import 'package:task_manager_app/domain/model/task.dart';
import 'package:task_manager_app/presentation/add_or_update/state/operation_state_notifier.dart';

import '../mock/repository/task_repository_mock.mocks.dart';

void main() {
  group('OperationStateNotifier', () {
    test('initial state is correct', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier =
          container.read(operationStateNotifierProvider(null).notifier);

      expect(notifier.state.title, '');
      expect(notifier.state.description, '');
      expect(notifier.state.isCompleted, false);
      expect(notifier.state.status, OperationStatus.initial);
    });

    test('update form should changes the state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier =
          container.read(operationStateNotifierProvider(null).notifier);
      notifier.updateTitle('New Title');
      notifier.updateDescription('New Description');

      expect(notifier.state.title, 'New Title');
      expect(notifier.state.description, 'New Description');
    });

    test('submitData adds a new task should success', () async {
      final testTask = Task(
        id: 0,
        title: "Task title",
        description: "Task description",
        isCompleted: false,
      );
      final mockTaskRepository = MockTaskRepository();
      final container = ProviderContainer(
        overrides: [
          taskRepositoryProvider.overrideWithValue(mockTaskRepository),
        ],
      );
      addTearDown(container.dispose);

      when(mockTaskRepository.getTaskList()).thenAnswer(
        (_) async => [],
      );
      when(mockTaskRepository.addTask(testTask)).thenAnswer(
        (_) async => testTask,
      );

      final notifier =
          container.read(operationStateNotifierProvider(null).notifier);
      notifier.updateTitle('Task title');
      notifier.updateDescription('Task description');

      await notifier.submitData();
      expect(notifier.state.status, OperationStatus.success);
    });
  });
}
