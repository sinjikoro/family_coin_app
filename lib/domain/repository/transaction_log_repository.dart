import 'package:family_coin/domain/model/user/transaction_log.dart';
import 'package:family_coin/domain/value_object/id.dart';

/// タスクログのリポジトリインターフェース
abstract class TransactionLogRepository {
  /// タスクログを保存する
  Future<void> addLog({required TransactionLog transactionLog});

  /// ユーザーのタスクログ一覧を取得する
  Future<List<TransactionLog>> getTransactionLogList({required UserId userId});
}
