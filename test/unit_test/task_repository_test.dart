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
      () {
        when(taskDatasource.getAllTasks()).thenAnswer(
          (_) => Future.value([
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
          ]),
        );
      },
    );

    test("getAllTasks should return the entity list", () {
      taskRepository.getTaskList().then(
        (list) {
          expect(list.length, 2);
          expect(list.first.id, 1);
          expect(list.first.isCompleted, true);
          verify(taskDatasource.getAllTasks()).called(1);
        },
      );
    });
  });

  group("TaskRepository", () {
    final testEntity = {
      "id": null,
      "title": "title 1",
      "description": "description 1",
      "is_completed": 0,
    };

    setUp(() {
      when(taskDatasource.insertTask(testEntity)).thenAnswer(
        (_) => Future.value({
          "id": 10,
          "title": "title 1",
          "description": "description 1",
          "is_completed": 0,
        }),
      );
    });

    test(
      "insertTask should return the inserted task",
      () {
        final newTask = Task(
          id: 0,
          title: "title 1",
          description: "description 1",
          isCompleted: false,
        );
        taskRepository.addTask(newTask).then(
          (result) {
            expect(result.id, 10);
            verify(taskDatasource.insertTask(testEntity)).called(1);
          },
        );
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

    setUp(() {
      when(taskDatasource.updateTask(testEntity)).thenAnswer(
        (_) => Future.value(),
      );
    });

    test(
      "updateTask should return void",
      () {
        taskRepository
            .updateTask(
              Task(
                id: 1,
                title: "new title",
                description: "new description",
                isCompleted: true,
              ),
            )
            .then(
              (value) =>
                  verify(taskDatasource.updateTask(testEntity)).called(1),
            );
      },
    );
  });

  group("TaskRepository", () {
    setUp(() {
      when(taskDatasource.deleteTask(1)).thenAnswer(
        (_) => Future.value(),
      );
    });

    test(
      "deleteTask should return void",
      () {
        taskRepository.deleteTask(1).then(
              (value) => verify(taskDatasource.deleteTask(1)).called(1),
            );
      },
    );
  });
}
