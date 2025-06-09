import 'package:family_coin/application/provider/task_list_state.dart';
import 'package:family_coin/domain/repository/task_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:get_it/get_it.dart';

/// タスク削除のユースケース
class DeleteTaskUseCase {
  /// コンストラクタ
  const DeleteTaskUseCase({required this.taskListState});

  /// タスク一覧のState
  final TaskListState taskListState;

  /// タスクを削除する
  Future<void> execute({required TaskId taskId}) async {
    final repository = GetIt.instance<TaskRepository>();
    await repository.deleteTask(taskId: taskId);
    await taskListState.fetch();
  }
}
