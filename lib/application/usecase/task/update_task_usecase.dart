import 'package:family_coin/application/provider/task_list_state.dart';
import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/repository/task_repository.dart';
import 'package:get_it/get_it.dart';

/// タスク更新のユースケース
class UpdateTaskUseCase {
  /// コンストラクタ
  const UpdateTaskUseCase({required this.taskListState});

  /// タスク一覧のState
  final TaskListState taskListState;

  /// タスクを更新する
  Future<void> execute({required Task task}) async {
    final repository = GetIt.instance<TaskRepository>();
    await repository.updateTask(task: task);
    await taskListState.fetchTaskList();
  }
}
