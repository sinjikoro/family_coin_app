import 'package:family_coin/domain/model/wishitem/exchanged_record.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/infrastructure/client/sqflite_client.dart';
import 'package:family_coin/infrastructure/datasource/exchanged_record_datasorce.dart';

/// 交換履歴のローカルデータソース
class ExchangedRecordLocalDataSource implements ExchangedRecordDataSource {
  /// コンストラクタ
  const ExchangedRecordLocalDataSource(this._client);

  final SqfliteClient _client;

  static const _exchangedRecordsTable = 'exchanged_records';

  static const _userIdColumn = 'userId';

  /// 交換履歴を作成する
  @override
  Future<void> create({required ExchangedRecord exchangedRecord}) async {
    final db = await _client.db;
    await db.insert(_exchangedRecordsTable, exchangedRecord.toJson());
  }

  /// 交換履歴一覧を取得する
  @override
  Future<List<ExchangedRecord>> getExchangedRecordList({
    required UserId userId,
  }) async {
    final db = await _client.db;
    final result = await db.query(
      _exchangedRecordsTable,
      where: '$_userIdColumn = ?',
      whereArgs: [userId.value],
    );
    return result.map(ExchangedRecord.fromJson).toList();
  }
}
