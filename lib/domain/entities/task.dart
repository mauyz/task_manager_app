class Task {
  final int? id;
  final String title;
  final String description;
  final bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      "description"
          'isCompleted': isCompleted,
    };
  }

  Task.fromMap(Map<String, dynamic> map)
      : id = map['id'] != null ? map['id'] as int : null,
        title = map['title'] as String,
        description = map['description'] as String,
        isCompleted = (map['isCompleted'] as int) == 1 ? true : false;

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Task && other.id == id;
  }
}
