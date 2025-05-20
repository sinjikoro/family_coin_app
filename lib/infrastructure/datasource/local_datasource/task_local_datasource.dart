import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/infrastructure/client/sqflite_client.dart';
import 'package:family_coin/infrastructure/datasource/task_datasource.dart';

/// ローカルデータソース
class TaskLocalDataSource implements TaskDataSource {
  /// コンストラクタ
  const TaskLocalDataSource(this._client);

  final SqfliteClient _client;

  static const _tasksTable = 'tasks';

  static const _idColumn = 'id';
  static const _userIdColumn = 'userId';

  /// タスクを取得する
  @override
  Future<Task> getTask({required TaskId taskId}) async {
    final db = await _client.db;
    final result = await db.query(_tasksTable, where: '$_idColumn = ?', whereArgs: [taskId.value]);
    if (result.isEmpty) {
      throw Exception('Task not found');
    }
    return Task.fromJson(result.first);
  }

  /// タスク一覧を取得する
  @override
  Future<List<Task>> getTaskList({required UserId userId}) async {
    final db = await _client.db;
    final result = await db.query(_tasksTable, where: '$_userIdColumn = ?', whereArgs: [userId.value]);
    return result.map(Task.fromJson).toList();
  }

  /// タスクを作成する
  @override
  Future<void> createTask(Task task) async {
    final db = await _client.db;
    await db.transaction((txn) async {
      await txn.insert(_tasksTable, task.toJson());
    });
  }

  /// タスクを更新する
  @override
  Future<void> updateTask({required TaskId taskId, required Task task}) async {
    final db = await _client.db;
    await db.transaction((txn) async {
      final updatedCount = await txn.update(
        _tasksTable,
        task.toJson(),
        where: '$_idColumn = ?',
        whereArgs: [taskId.value],
      );
      if (updatedCount == 0) {
        throw Exception('Task not found');
      }
    });
  }

  /// タスクを削除する
  @override
  Future<void> deleteTask({required TaskId taskId}) async {
    final db = await _client.db;
    await db.transaction((txn) async {
      final deletedCount = await txn.delete(_tasksTable, where: '$_idColumn = ?', whereArgs: [taskId.value]);
      if (deletedCount == 0) {
        throw Exception('Task not found');
      }
    });
  }
}
