import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/repository/task_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:get_it/get_it.dart';

/// タスク取得のユースケース
class GetTaskUseCase {
  /// コンストラクタ
  const GetTaskUseCase();

  /// タスクを取得する
  Future<Task> execute({required TaskId taskId}) async {
    final repository = GetIt.instance<TaskRepository>();
    return await repository.getTask(taskId: taskId);
  }
}
