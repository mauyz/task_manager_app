/// A class representing a task with properties for managing task details.
///
/// The [Task] class models a task with an ID, title, description, and completion status.
class Task {
  /// The unique identifier for the task.
  final int id;

  /// The title of the task.
  final String title;

  /// A detailed description of the task.
  final String description;

  /// A boolean indicating whether the task is completed.
  final bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Task && other.id == id;
  }

  /// Creates a copy of the current [Task] instance with optional modifications.
  Task copyWith({
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Task(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
