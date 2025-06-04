import 'package:family_coin/domain/model/wishitem/exchanged_record.dart';
import 'package:family_coin/domain/value_object/id.dart';

/// 交換履歴のリポジトリインターフェース
abstract class ExchangedRecordRepository {
  /// 交換履歴を保存する
  Future<void> addExchangedRecord({required ExchangedRecord exchangedRecord});

  /// ユーザーの交換履歴一覧を取得する
  Future<List<ExchangedRecord>> getExchangedRecordList({
    required UserId userId,
  });
}
