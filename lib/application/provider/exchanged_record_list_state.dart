import 'package:family_coin/application/provider/logged_in_user_state.dart';
import 'package:family_coin/domain/model/wishitem/exchanged_record.dart';
import 'package:family_coin/domain/repository/exchanged_record_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exchanged_record_list_state.g.dart';

/// 交換履歴一覧のState
@riverpod
class ExchangedRecordListState extends _$ExchangedRecordListState {
  final ExchangedRecordRepository _repository =
      GetIt.instance<ExchangedRecordRepository>();

  @override
  FutureOr<List<ExchangedRecord>> build() async =>
      await _fetchExchangedRecordList();

  Future<List<ExchangedRecord>> _fetchExchangedRecordList() async {
    final loggedInUser = await ref.read(loggedInUserStateProvider.future);
    return await _repository.getExchangedRecordList(userId: loggedInUser.id);
  }

  /// 交換履歴一覧を取得する
  Future<void> fetchExchangedRecordList() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetchExchangedRecordList);
  }
}
