import 'package:family_coin/application/provider/transaction_log_list_state.dart';
import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/model/user/transaction_log.dart';
import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/repository/transaction_log_repository.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/domain/value_object/transaction_type.dart';
import 'package:get_it/get_it.dart';

/// タスク完了のユースケース
class CompleteTaskUseCase {
  /// コンストラクタ
  const CompleteTaskUseCase({required this.transactionLogListState});

  /// タスクログ一覧のState
  final TransactionLogListState transactionLogListState;

  /// タスクを完了する
  Future<void> execute({required User user, required Task task}) async {
    final transactionLogRepository = GetIt.instance<TransactionLogRepository>();
    final userRepository = GetIt.instance<UserRepository>();

    // ユーザーのコイン残高を更新
    final updateUser = await userRepository.getUser(userId: user.id);
    await userRepository.updateUser(
      userId: user.id,
      user: updateUser.earnFamilyCoin(amount: task.earnCoins),
    );

    // タスクログを作成
    final now = DateTime.now();
    final log = TransactionLog(
      id: LogId.generate(),
      userId: user.id,
      type: TransactionType.earn,
      amount: task.earnCoins,
      description: task.name,
      createdAt: now,
      updatedAt: now,
    );

    // タスクログを保存
    await transactionLogRepository.addLog(transactionLog: log);
    await transactionLogListState.fetch();
  }
}
