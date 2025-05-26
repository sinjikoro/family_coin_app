import 'package:family_coin/domain/model/task/task_log.dart';
import 'package:family_coin/domain/value_object/id.dart';

/// タスクログのデータソース
abstract class TaskLogDataSource {
  /// タスクログを作成する
  Future<void> create({required TaskLog taskLog});

  /// タスクログ一覧を取得する
  Future<List<TaskLog>> getTaskLogList({required UserId userId});
}
