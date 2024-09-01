import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_manager_app/data/repository/task_repository_provider.dart';
import 'package:task_manager_app/domain/model/task.dart';
import 'package:task_manager_app/domain/repository/task_repository.dart';
import 'package:task_manager_app/presentation/home/state/task_list_state_notifier.dart';

import '../mock/repository/task_repository_mock.mocks.dart';

void main() {
  late TaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
  });

  group('TaskListStateNotifier', () {
    test('Initial state should be loading and then data should be loaded', () async {
      final mockTasks = [
        Task(
          id: 1,
          title: 'Title 1',
          description: 'Description 1',
          isCompleted: false,
        )
      ];
      when(mockTaskRepository.getTaskList()).thenAnswer((_) async => mockTasks);

      final container = ProviderContainer(
        overrides: [
          taskRepositoryProvider.overrideWithValue(mockTaskRepository),
        ],
      );
      expect(container.read(taskListStateNotifierProvider),
          const AsyncLoading<List<Task>>());

      final tasks = await container.read(taskListStateNotifierProvider.future);

      expect(tasks, mockTasks);
      verify(mockTaskRepository.getTaskList()).called(1);
    });

    test('addTask should add a new task to the state', () async {
      final task = Task(
        id: 2,
        title: 'New Task',
        description: 'New Desc',
        isCompleted: false,
      );
      when(mockTaskRepository.addTask(task)).thenAnswer((_) async => task);
      when(mockTaskRepository.getTaskList()).thenAnswer((_) async => []);

      final container = ProviderContainer(
        overrides: [
          taskRepositoryProvider.overrideWithValue(mockTaskRepository),
        ],
      );

      final notifier = container.read(taskListStateNotifierProvider.notifier);
      await notifier.addTask(task);

      final state = container.read(taskListStateNotifierProvider);
      expect(state.asData?.value, [task]);
      verify(mockTaskRepository.addTask(task)).called(1);
    });

    test('updateTask should update the existing task in the state', () async {
      final task = Task(
        id: 1,
        title: 'Updated Task',
        description: 'Updated Desc',
        isCompleted: true,
      );
      final initialTask = Task(
        id: 1,
        title: 'Initial title',
        description: 'Initial desc',
        isCompleted: false,
      );

      when(mockTaskRepository.updateTask(task)).thenAnswer((_) async {});
      when(mockTaskRepository.getTaskList())
          .thenAnswer((_) async => [initialTask]);

      final container = ProviderContainer(
        overrides: [
          taskRepositoryProvider.overrideWithValue(mockTaskRepository),
        ],
      );

      final notifier = container.read(taskListStateNotifierProvider.notifier);
      await notifier.updateTask(task);

      final state = container.read(taskListStateNotifierProvider);
      expect(state.asData?.value, [task]);
      verify(mockTaskRepository.updateTask(task)).called(1);
    });

    test('deleteTask removes the task from the state', () async {
      final task = Task(
        id: 1,
        title: 'Title',
        description: 'Desc',
        isCompleted: true,
      );

      when(mockTaskRepository.deleteTask(1)).thenAnswer((_) async {});
      when(mockTaskRepository.getTaskList()).thenAnswer((_) async => [task]);

      final container = ProviderContainer(
        overrides: [
          taskRepositoryProvider.overrideWithValue(mockTaskRepository),
        ],
      );

      final notifier = container.read(taskListStateNotifierProvider.notifier);
      await notifier.deleteTask(task.id);

      final state = container.read(taskListStateNotifierProvider);
      expect(state.asData?.value, isEmpty);
      verify(mockTaskRepository.deleteTask(task.id)).called(1);
    });
  });
}
