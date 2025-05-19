import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/value_object/id.dart';

/// ユーザー情報を保存するデータソース
abstract class TaskDataSource {
  /// 対象ユーザーのタスクを取得する
  Future<Task> getTask({required Id taskId});

  /// 対象ユーザーのタスク一覧を取得する
  Future<List<Task>> getTaskList({required Id userId});

  /// タスクを作成する
  Future<void> createTask(Task task);

  /// タスクを更新する
  /// 更新対象のuserIdが合致しない場合はエラーを返す
  Future<void> updateTask({required Id taskId, required Task task});

  /// タスクを削除する
  /// 削除対象のuserIdが合致しない場合はエラーを返す
  Future<void> deleteTask({required Id taskId});
}
