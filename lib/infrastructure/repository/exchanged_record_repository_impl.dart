import 'package:family_coin/domain/model/wishitem/exchanged_record.dart';
import 'package:family_coin/domain/repository/exchanged_record_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/infrastructure/datasource/exchanged_record_datasorce.dart';

/// 交換履歴のリポジトリ実装
class ExchangedRecordRepositoryImpl implements ExchangedRecordRepository {
  /// コンストラクタ
  const ExchangedRecordRepositoryImpl(this._dataSource);

  /// データソース
  final ExchangedRecordDataSource _dataSource;

  @override
  Future<void> addExchangedRecord({required ExchangedRecord exchangedRecord}) =>
      _dataSource.create(exchangedRecord: exchangedRecord);

  @override
  Future<List<ExchangedRecord>> getExchangedRecordList({
    required UserId userId,
  }) => _dataSource.getExchangedRecordList(userId: userId);
}
