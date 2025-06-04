import 'package:family_coin/domain/model/wishitem/exchanged_record.dart';
import 'package:family_coin/domain/value_object/id.dart';

/// 交換履歴のデータソース
abstract class ExchangedRecordDataSource {
  /// 交換履歴を作成する
  Future<void> create({required ExchangedRecord exchangedRecord});

  /// 交換履歴一覧を取得する
  Future<List<ExchangedRecord>> getExchangedRecordList({
    required UserId userId,
  });
}
