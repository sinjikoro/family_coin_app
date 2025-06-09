import 'package:family_coin/domain/model/user/transaction_log.dart';
import 'package:family_coin/domain/value_object/id.dart';

/// タスクログのデータソース
abstract class TransactionLogDataSource {
  /// タスクログを作成する
  Future<void> create({required TransactionLog transactionLog});

  /// タスクログ一覧を取得する
  Future<List<TransactionLog>> getTransactionLogList({required UserId userId});
}
