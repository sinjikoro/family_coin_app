import 'package:family_coin/application/provider/active_user_state.dart';
import 'package:family_coin/domain/model/user/transaction_log.dart';
import 'package:family_coin/domain/repository/transaction_log_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_log_list_state.g.dart';

/// アクティブなユーザーの取引履歴一覧
@riverpod
class TransactionLogListState extends _$TransactionLogListState {
  final TransactionLogRepository _repository =
      GetIt.instance<TransactionLogRepository>();

  @override
  FutureOr<List<TransactionLog>> build() async =>
      await _fetchTransactionLogList();

  Future<List<TransactionLog>> _fetchTransactionLogList() async {
    final activeUser = await ref.read(activeUserStateProvider.future);
    if (activeUser == null) return [];
    return await _repository.getTransactionLogList(userId: activeUser.userId);
  }

  /// タスクログ一覧を取得する
  Future<void> fetch() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetchTransactionLogList);
  }
}
