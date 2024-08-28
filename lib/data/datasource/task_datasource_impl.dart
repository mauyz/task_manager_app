import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_manager_app/core/constant/db_constants.dart';
import 'package:task_manager_app/data/datasource/task_datasource.dart';
import 'package:task_manager_app/data/entity/task_entity.dart';

class TaskDatasourceImpl implements TaskDatasource {
  Database? _database;

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

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  @override
  Future<TaskListEntity> getAllTasks() async {
    final db = await database;
    return db.query(DbConstants.tableName);
  }

  @override
  Future<TaskEntity> insertTask(TaskEntity taskEntity) async {
    final db = await database;
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

  @override
  Future<void> updateTask(TaskEntity taskEntity) async {
    final db = await database;
    await db.update(
      DbConstants.tableName,
      taskEntity,
      where: '${DbConstants.columnId} = ?',
      whereArgs: [taskEntity["id"]],
    );
  }

  @override
  Future<void> deleteTask(int taskId) async {
    final db = await database;
    await db.delete(
      DbConstants.tableName,
      where: '${DbConstants.columnId} = ?',
      whereArgs: [taskId],
    );
  }
}
