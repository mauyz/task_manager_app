import 'package:task_manager_app/data/entity/task_entity.dart';
import 'package:task_manager_app/domain/model/task.dart';

class TaskMapper {
  static Task entityToModel(final TaskEntity map) {
    return Task(
      id: map["id"],
      title: map["title"],
      description: map["description"],
      isCompleted: map["is_completed"] == 1,
    );
  }

  static TaskEntity modelToEntity(final Task model) {
    return {
      'id': model.id,
      'title': model.title,
      'description': model.description,
      'is_completed': model.isCompleted ? 1 : 0,
    };
  }

  static TaskEntity modelToNewEntity(final Task model) {
    return {
      'id': null,
      'title': model.title,
      'description': model.description,
      'is_completed': model.isCompleted ? 1 : 0,
    };
  }
}
