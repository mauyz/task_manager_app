import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager_app/data/entity/task_entity.dart';
import 'package:task_manager_app/data/mapper/task_mapper.dart';
import 'package:task_manager_app/domain/model/task.dart';

void main() {
  group(
    "#taskMapper",
    () {
      final Task testModel = Task(
        id: 1,
        title: "title",
        description: "description",
        isCompleted: false,
      );
      final TaskEntity testEntity = {
        "id": 1,
        "title": "title",
        "description": "description",
        "is_completed": 0,
      };

      test(
        "should return the entity",
        () {
          final result = TaskMapper.modelToEntity(testModel);
          expect(result, testEntity);
        },
      );

      test(
        "should return the model",
        () {
          final result = TaskMapper.entityToModel(testEntity);
          expect(result, testModel);
        },
      );

      test(
        "should return entity with id null",
        () {
          final result = TaskMapper.modelToNewEntity(testModel);
          expect(result['id'], isNull);
        },
      );
    },
  );
}
