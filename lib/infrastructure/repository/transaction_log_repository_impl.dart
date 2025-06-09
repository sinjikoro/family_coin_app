import 'package:family_coin/domain/model/user/transaction_log.dart';
import 'package:family_coin/domain/repository/transaction_log_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/infrastructure/datasource/transaction_log_datasource.dart';

/// タスクログのリポジトリ実装
class TransactionLogRepositoryImpl implements TransactionLogRepository {
  /// コンストラクタ
  const TransactionLogRepositoryImpl(this._dataSource);

  final TransactionLogDataSource _dataSource;

  @override
  Future<void> addLog({required TransactionLog transactionLog}) =>
      _dataSource.create(transactionLog: transactionLog);

  @override
  Future<List<TransactionLog>> getTransactionLogList({
    required UserId userId,
  }) => _dataSource.getTransactionLogList(userId: userId);
}
