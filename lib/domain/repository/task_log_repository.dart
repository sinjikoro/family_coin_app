import 'package:family_coin/domain/model/task/task_log.dart';
import 'package:family_coin/domain/value_object/id.dart';

/// タスクログのリポジトリインターフェース
abstract class TaskLogRepository {
  /// タスクログを保存する
  Future<void> addLog({required TaskLog taskLog});

  /// ユーザーのタスクログ一覧を取得する
  Future<List<TaskLog>> getTaskLogList({required UserId userId});
}
