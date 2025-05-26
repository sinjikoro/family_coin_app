import 'package:family_coin/domain/model/task/task_log.dart';
import 'package:family_coin/domain/repository/task_log_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/infrastructure/datasource/task_log_datasource.dart';

/// タスクログのリポジトリ実装
class TaskLogRepositoryImpl implements TaskLogRepository {
  /// コンストラクタ
  const TaskLogRepositoryImpl(this._dataSource);

  final TaskLogDataSource _dataSource;

  @override
  Future<void> addLog({required TaskLog taskLog}) =>
      _dataSource.create(taskLog: taskLog);

  @override
  Future<List<TaskLog>> getTaskLogList({required UserId userId}) =>
      _dataSource.getTaskLogList(userId: userId);
}
