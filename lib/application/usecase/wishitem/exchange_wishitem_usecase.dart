import 'package:family_coin/application/provider/transaction_log_list_state.dart';
import 'package:family_coin/domain/model/user/transaction_log.dart';
import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/repository/transaction_log_repository.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/domain/value_object/transaction_type.dart';
import 'package:get_it/get_it.dart';

/// ほしいもの交換のユースケース
class ExchangeWishitemUseCase {
  /// コンストラクタ
  const ExchangeWishitemUseCase({required this.transactionLogListState});

  /// 交換履歴一覧のState
  final TransactionLogListState transactionLogListState;

  /// ほしいものを交換する
  Future<void> execute({required User user, required Wishitem wishitem}) async {
    final transactionLogRepository = GetIt.instance<TransactionLogRepository>();
    final userRepository = GetIt.instance<UserRepository>();

    // ユーザーのコイン残高を更新
    final updateUser = await userRepository.getUser(userId: user.userId);
    await userRepository.updateUser(
      userId: user.userId,
      user: updateUser.useFamilyCoin(amount: wishitem.price),
    );

    // 交換履歴を作成
    final now = DateTime.now();
    final log = TransactionLog(
      transactionLogId: LogId.generate(),
      userId: user.userId,
      type: TransactionType.exchange,
      amount: wishitem.price,
      description: wishitem.name,
      createdAt: now,
      updatedAt: now,
    );
    await transactionLogRepository.addLog(transactionLog: log);

    // 交換履歴一覧を更新
    await transactionLogListState.fetch();
  }
}
