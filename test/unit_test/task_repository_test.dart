import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_manager_app/data/repository/task_repository_impl.dart';
import 'package:task_manager_app/domain/model/task.dart';

import '../mock/datasource/task_datasource_mock.mocks.dart';

void main() {
  final taskDatasource = MockTaskDatasource();
  final taskRepository = TaskRepositoryImpl(taskDatasource);
  group("TaskRepository", () {
    setUp(
      () async {
        when(taskDatasource.getAllTasks()).thenAnswer(
          (_) async => [
            {
              "id": 1,
              "title": "title 1",
              "description": "description 1",
              "is_completed": 1,
            },
            {
              "id": 2,
              "title": "title 1",
              "description": "description 1",
              "is_completed": 0,
            }
          ],
        );
      },
    );

    test("getAllTasks should return the entity list", () async {
      final list = await taskRepository.getTaskList();
      expect(list.length, 2);
      expect(list.first.id, 1);
      expect(list.first.isCompleted, true);
      verify(taskDatasource.getAllTasks()).called(1);
    });
  });

  group("TaskRepository", () {
    final testEntity = {
      "id": null,
      "title": "title 1",
      "description": "description 1",
      "is_completed": 0,
    };

    setUp(() async {
      when(taskDatasource.insertTask(testEntity)).thenAnswer(
        (_) async => {
          "id": 10,
          "title": "title 1",
          "description": "description 1",
          "is_completed": 0,
        },
      );
    });

    test(
      "insertTask should return the inserted task",
      () async {
        final newTask = Task(
          id: 0,
          title: "title 1",
          description: "description 1",
          isCompleted: false,
        );
        final result = await taskRepository.addTask(newTask);
        expect(result.id, 10);
        verify(taskDatasource.insertTask(testEntity)).called(1);
      },
    );
  });

  group("TaskRepository", () {
    final testEntity = {
      "id": 1,
      "title": "new title",
      "description": "new description",
      "is_completed": 1,
    };

    setUp(() async {
      when(taskDatasource.updateTask(testEntity)).thenAnswer(
        (_) async => {},
      );
    });

    test(
      "updateTask should return void",
      () async {
        await taskRepository.updateTask(
          Task(
            id: 1,
            title: "new title",
            description: "new description",
            isCompleted: true,
          ),
        );
        verify(taskDatasource.updateTask(testEntity)).called(1);
      },
    );
  });

  group("TaskRepository", () {
    setUp(() async {
      when(taskDatasource.deleteTask(1)).thenAnswer(
        (_) async => {},
      );
    });

    test(
      "deleteTask should return void",
      () async {
        await taskRepository.deleteTask(1);
        verify(taskDatasource.deleteTask(1)).called(1);
      },
    );
  });
}
