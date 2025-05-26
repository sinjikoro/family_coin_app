import 'package:family_coin/application/provider/task_log_list_state.dart';
import 'package:family_coin/application/provider/user_list_state.dart';
import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/model/task/task_log.dart';
import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/value_object/approval_status.dart';
import 'package:family_coin/domain/value_object/id.dart';

/// タスク完了のユースケース
class CompleteTaskUseCase {
  /// コンストラクタ
  const CompleteTaskUseCase({
    required this.userState,
    required this.taskLogListState,
  });

  /// ユーザーState
  final UserListState userState;

  /// タスクログ一覧のState
  final TaskLogListState taskLogListState;

  /// タスクを完了する
  Future<void> execute({required User user, required Task task}) async {
    // ユーザーのコイン残高を更新
    await userState.addUserFamilyCoin(
      userId: user.id,
      familyCoin: task.earnCoins,
    );

    final now = DateTime.now();

    // タスクログを作成
    final taskLog = TaskLog(
      id: RecordId.generate(),
      taskId: task.id,
      userId: user.id,
      approvalStatus: ApprovalStatus.approved(),
      earnedCoins: task.earnCoins,
      earnedAt: now,
      createdAt: now,
      updatedAt: now,
    );

    // タスクログを保存
    await taskLogListState.addTaskLog(taskLog: taskLog);
  }
}
