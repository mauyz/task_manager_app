import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_manager_app/core/constant/db_constants.dart';
import 'package:task_manager_app/data/datasource/task_datasource.dart';
import 'package:task_manager_app/data/entity/task_entity.dart';

/// Implementation of the [TaskDatasource] interface using SQLite.
class TaskDatasourceImpl implements TaskDatasource {
  Database? database;

  /// Initializes the database by opening or creating it if it doesn't exist.
  ///
  /// The database is created with a table for tasks according to the constants defined in [DbConstants].
  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DbConstants.databaseName),
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE ${DbConstants.tableName}(
            ${DbConstants.columnId} INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            ${DbConstants.columnTitle} TEXT NOT NULL,
            ${DbConstants.columnDescription} TEXT NOT NULL,
            ${DbConstants.columnIsCompleted} INTEGER NOT NULL
          )
        ''');
      },
      version: DbConstants.databaseVersion,
    );
  }

  /// Provides a database instance, initializing it if necessary.
  ///
  /// This ensures that the database is opened only once during the app's lifecycle.
  Future<Database> get getDatabase async {
    database ??= await _initDatabase();
    return database!;
  }

  /// Retrieves all tasks from the database.
  ///
  /// Returns a [TaskListEntity] containing all tasks stored in the database.
  @override
  Future<TaskListEntity> getAllTasks() async {
    final db = await getDatabase;
    return db.query(DbConstants.tableName);
  }

  /// Inserts a new task into the database and returns the inserted [TaskEntity].
  ///
  /// The insertion is done inside a transaction to ensure data integrity.
  @override
  Future<TaskEntity> insertTask(TaskEntity taskEntity) async {
    final db = await getDatabase;
    late final TaskEntity result;
    await db.transaction(
      (txn) async {
        final id = await txn.insert(
          DbConstants.tableName,
          taskEntity,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        final resultsQuery = await txn.query(
          DbConstants.tableName,
          where: '${DbConstants.columnId} = ?',
          whereArgs: [id],
        );
        result = resultsQuery.first;
      },
    );
    return result;
  }

  /// Updates an existing task in the database.
  ///
  /// The task is matched by its ID and updated with the new values from [taskEntity].
  @override
  Future<void> updateTask(TaskEntity taskEntity) async {
    final db = await getDatabase;
    await db.update(
      DbConstants.tableName,
      taskEntity,
      where: '${DbConstants.columnId} = ?',
      whereArgs: [taskEntity["id"]],
    );
  }

  /// Deletes a task from the database by its ID.
  ///
  /// The task is identified by [taskId] and removed from the database.
  @override
  Future<void> deleteTask(int taskId) async {
    final db = await getDatabase;
    await db.delete(
      DbConstants.tableName,
      where: '${DbConstants.columnId} = ?',
      whereArgs: [taskId],
    );
  }
}
