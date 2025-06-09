import 'package:family_coin/domain/model/user/transaction_log.dart';
import 'package:family_coin/domain/repository/transaction_log_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:mocktail/mocktail.dart';

class MockTransactionLogRepository extends Mock
    implements TransactionLogRepository {
  List<TransactionLog> dummyTransactionLogList = [];

  @override
  Future<List<TransactionLog>> getTransactionLogList({
    required UserId userId,
  }) async =>
      dummyTransactionLogList
          .where((element) => element.userId == userId)
          .toList();

  @override
  Future<void> addLog({required TransactionLog transactionLog}) async =>
      dummyTransactionLogList.add(transactionLog);
}
