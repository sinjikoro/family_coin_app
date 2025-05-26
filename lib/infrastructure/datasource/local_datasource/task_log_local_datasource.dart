import 'package:family_coin/domain/model/task/task_log.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/infrastructure/client/sqflite_client.dart';
import 'package:family_coin/infrastructure/datasource/task_log_datasource.dart';

/// タスクログのローカルデータソース
class TaskLogLocalDataSource implements TaskLogDataSource {
  /// コンストラクタ
  const TaskLogLocalDataSource(this._client);

  final SqfliteClient _client;

  static const _taskLogsTable = 'task_logs';

  static const _userIdColumn = 'userId';

  /// タスクログを作成する
  @override
  Future<void> create({required TaskLog taskLog}) async {
    final db = await _client.db;
    await db.insert(_taskLogsTable, taskLog.toJson());
  }

  /// タスクログ一覧を取得する
  @override
  Future<List<TaskLog>> getTaskLogList({required UserId userId}) async {
    final db = await _client.db;
    final result = await db.query(
      _taskLogsTable,
      where: '$_userIdColumn = ?',
      whereArgs: [userId.value],
    );
    return result.map(TaskLog.fromJson).toList();
  }
}
