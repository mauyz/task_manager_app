import 'package:task_manager_app/data/entity/task_entity.dart';
import 'package:task_manager_app/domain/model/task.dart';

/// A utility class that handles the conversion between task entities and task models.
class TaskMapper {
  /// Converts a [TaskEntity] (a map from the database) to a [Task] model.
  static Task entityToModel(final TaskEntity map) {
    return Task(
      id: map["id"],
      title: map["title"],
      description: map["description"],
      isCompleted: map["is_completed"] == 1,
    );
  }

  /// Converts a [Task] model to a [TaskEntity] (a map for the database).
  static TaskEntity modelToEntity(final Task model) {
    return {
      'id': model.id,
      'title': model.title,
      'description': model.description,
      'is_completed': model.isCompleted ? 1 : 0,
    };
  }

  /// Converts a [Task] model to a new [TaskEntity] with a null ID.
  static TaskEntity modelToNewEntity(final Task model) {
    return {
      'id': null,
      'title': model.title,
      'description': model.description,
      'is_completed': model.isCompleted ? 1 : 0,
    };
  }
}
