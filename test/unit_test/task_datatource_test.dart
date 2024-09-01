import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_manager_app/core/constant/db_constants.dart';
import 'package:task_manager_app/data/datasource/task_datasource_impl.dart';
import '../mock/database/database_mock.mocks.dart';

void main() {
  late TaskDatasourceImpl datasource;
  late MockDatabase mockDatabase;

  setUp(() {
    mockDatabase = MockDatabase();
    datasource = TaskDatasourceImpl();

    // Inject mock database
    datasource.database = mockDatabase;
  });

  group('TaskDatasourceImpl', () {
    test('should return all tasks from the database', () async {
      final mockTasks = [
        {
          'id': 1,
          'title': 'Task 1',
          'description': 'Description 1',
          'is_completed': 0
        },
        {
          'id': 2,
          'title': 'Task 2',
          'description': 'Description 2',
          'is_completed': 1
        },
      ];

      // Set up the mock database response
      when(mockDatabase.query(DbConstants.tableName))
          .thenAnswer((_) async => mockTasks);

      final tasks = await datasource.getAllTasks();

      // Verify and expect results
      expect(tasks, isNotEmpty);
      expect(tasks.length, 2);
      expect(tasks[0]['title'], 'Task 1');
    });

    test('should insert a task and return it with id', () async {
      final taskEntity = {
        'id': null,
        'title': 'Task 1',
        'description': 'Description 1',
        'is_completed': 0
      };

      // Mock the transaction method
      final mockTransaction = MockTransaction();
      when(mockDatabase.transaction(any)).thenAnswer((invocation) async {
        final callback = invocation.positionalArguments[0] as Future<void>
            Function(Transaction);
        await callback(mockTransaction);
      });

      when(mockTransaction.insert(
        DbConstants.tableName,
        taskEntity,
        conflictAlgorithm: ConflictAlgorithm.replace,
      )).thenAnswer((_) async => 1);

      // Set up the mock database response
      when(mockTransaction.query(
        DbConstants.tableName,
        where: '${DbConstants.columnId} = ?',
        whereArgs: [1],
      )).thenAnswer((_) async => [taskEntity..['id'] = 1]);

      final result = await datasource.insertTask(taskEntity);

      // Verify and expect results
      expect(result, isNotNull);
      expect(result['id'], 1);
      expect(result['title'], 'Task 1');
    });

    test('should update a task', () async {
      final taskEntity = {
        'id': 1,
        'title': 'New title',
        'description': 'New description',
        'is_completed': 0
      };

      // Set up the mock database response
      when(mockDatabase.update(
        DbConstants.tableName,
        taskEntity,
        where: '${DbConstants.columnId} = ?',
        whereArgs: [taskEntity['id']],
      )).thenAnswer((_) async => 1);

      // Call the method
      await datasource.updateTask(taskEntity);

      // Verify if update method was called with correct arguments
      verify(mockDatabase.update(
        DbConstants.tableName,
        taskEntity,
        where: '${DbConstants.columnId} = ?',
        whereArgs: [taskEntity['id']],
      )).called(1);
    });

    test('should delete a task by ID', () async {
      const taskId = 1;

      // Set up the mock database response
      when(mockDatabase.delete(
        DbConstants.tableName,
        where: '${DbConstants.columnId} = ?',
        whereArgs: [taskId],
      )).thenAnswer((_) async => 1);

      await datasource.deleteTask(taskId);

      // Verify if delete method was called with correct arguments
      verify(mockDatabase.delete(
        DbConstants.tableName,
        where: '${DbConstants.columnId} = ?',
        whereArgs: [taskId],
      )).called(1);
    });
  });
}
