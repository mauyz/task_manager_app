class DbConstants {
  const DbConstants._();

  /// Database name
  static const databaseName = "task_db";

  /// Database version
  static const databaseVersion = 1;

  //// Task table constants
  ///
  /// The name of the task table
  static const tableName = "task_table";

  /// The ID column in the task table
  static const columnId = "id";

  /// The title column in the task table
  static const columnTitle = "title";

  /// The description column in the task table
  static const columnDescription = "description";

  /// The completion status column in the task table
  static const columnIsCompleted = "is_completed";
}
