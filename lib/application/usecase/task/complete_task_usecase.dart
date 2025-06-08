import 'package:family_coin/application/provider/task_log_list_state.dart';
import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/model/task/task_log.dart';
import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/repository/task_log_repository.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:get_it/get_it.dart';

/// タスク完了のユースケース
class CompleteTaskUseCase {
  /// コンストラクタ
  const CompleteTaskUseCase({required this.taskLogListState});

  /// タスクログ一覧のState
  final TaskLogListState taskLogListState;

  /// タスクを完了する
  Future<void> execute({required User user, required Task task}) async {
    final taskLogRepository = GetIt.instance<TaskLogRepository>();
    final userRepository = GetIt.instance<UserRepository>();

    // ユーザーのコイン残高を更新
    final updateUser = await userRepository.getUser(userId: user.id);
    await userRepository.updateUser(
      userId: user.id,
      user: updateUser.earnFamilyCoin(amount: task.earnCoins),
    );

    // タスクログを作成
    final now = DateTime.now();
    final taskLog = TaskLog(
      id: RecordId.generate(),
      taskId: task.id,
      userId: user.id,
      earnedCoins: task.earnCoins,
      createdAt: now,
      updatedAt: now,
    );

    // タスクログを保存
    await taskLogRepository.addLog(taskLog: taskLog);
    await taskLogListState.fetchTaskLogList();
  }
}
