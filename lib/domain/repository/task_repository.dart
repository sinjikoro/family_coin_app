import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/value_object/id.dart';

/// タスクリポジトリ
abstract class TaskRepository {
  /// タスク一覧を取得する
  Future<List<Task>> getTaskList({required UserId userId});

  /// タスクを取得する
  Future<Task> getTask({required TaskId taskId});

  /// タスクを作成する
  Future<void> createTask(Task task);

  /// タスクを更新する
  Future<void> updateTask({required Task task});

  /// タスクを削除する
  Future<void> deleteTask({required TaskId taskId});
}
