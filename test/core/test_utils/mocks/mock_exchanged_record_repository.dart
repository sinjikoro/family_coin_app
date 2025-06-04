import 'package:family_coin/domain/model/wishitem/exchanged_record.dart';
import 'package:family_coin/domain/repository/exchanged_record_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:mocktail/mocktail.dart';

/// MockExchangedRecordRepository
class MockExchangedRecordRepository extends Mock
    implements ExchangedRecordRepository {
  List<ExchangedRecord> dummyExchangedRecordList = [];

  @override
  Future<List<ExchangedRecord>> getExchangedRecordList({
    required UserId userId,
  }) async =>
      dummyExchangedRecordList
          .where((element) => element.userId == userId)
          .toList();

  @override
  Future<void> addExchangedRecord({
    required ExchangedRecord exchangedRecord,
  }) async => dummyExchangedRecordList.add(exchangedRecord);
}
