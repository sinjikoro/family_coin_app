import 'package:family_coin/application/provider/task_list_state.dart';
import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/repository/task_repository.dart';
import 'package:family_coin/domain/value_object/difficuly.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:get_it/get_it.dart';

/// タスク作成のユースケース
class CreateTaskUseCase {
  /// コンストラクタ
  const CreateTaskUseCase({required this.taskListState});

  /// タスク一覧のState
  final TaskListState taskListState;

  /// タスクを作成する
  Future<void> execute({
    required String name,
    required UserId userId,
    required FamilyCoin earnCoins,
    String description = '',
    Difficulty difficulty = Difficulty.normal,
  }) async {
    /// タスクリポジトリ
    final repository = GetIt.instance<TaskRepository>();

    final task = Task(
      taskId: TaskId.generate(),
      name: name,
      description: description,
      userId: userId,
      earnCoins: earnCoins,
      difficulty: difficulty,
    );
    await repository.createTask(task);
    await taskListState.fetch();
  }
}
