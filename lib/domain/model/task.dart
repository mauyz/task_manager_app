class Task {
  final int id;
  final String title;
  final String description;
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
}
