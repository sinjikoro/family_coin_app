import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/repository/task_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/infrastructure/datasource/task_datasource.dart';

/// UserRepositoryの実装
class TaskRepositoryImpl implements TaskRepository {
  /// コンストラクタ
  const TaskRepositoryImpl(this._dataSource);

  final TaskDataSource _dataSource;

  @override
  Future<List<Task>> getTaskList({required UserId userId}) =>
      _dataSource.getTaskList(userId: userId);

  @override
  Future<Task> getTask({required TaskId taskId}) =>
      _dataSource.getTask(taskId: taskId);

  @override
  Future<void> createTask(Task task) => _dataSource.createTask(task);

  @override
  Future<void> deleteTask({required TaskId taskId}) =>
      _dataSource.deleteTask(taskId: taskId);

  @override
  Future<void> updateTask({required Task task}) =>
      _dataSource.updateTask(task: task);
}
