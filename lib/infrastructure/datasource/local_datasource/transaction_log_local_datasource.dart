import 'package:family_coin/domain/model/user/transaction_log.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/infrastructure/client/sqflite_client.dart';
import 'package:family_coin/infrastructure/datasource/transaction_log_datasource.dart';

/// タスクログのローカルデータソース
class TransactionLogLocalDataSource implements TransactionLogDataSource {
  /// コンストラクタ
  const TransactionLogLocalDataSource(this._client);

  final SqfliteClient _client;

  static const _transactionLogsTable = 'transaction_logs';

  static const _userIdColumn = 'userId';

  /// タスクログを作成する
  @override
  Future<void> create({required TransactionLog transactionLog}) async {
    final db = await _client.db;
    await db.insert(_transactionLogsTable, transactionLog.toJson());
  }

  /// タスクログ一覧を取得する
  @override
  Future<List<TransactionLog>> getTransactionLogList({
    required UserId userId,
  }) async {
    final db = await _client.db;
    final result = await db.query(
      _transactionLogsTable,
      where: '$_userIdColumn = ?',
      whereArgs: [userId.value],
    );
    return result.map(TransactionLog.fromJson).toList();
  }
}
