import 'package:family_coin/application/provider/exchanged_record_list_state.dart';
import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/model/wishitem/exchanged_record.dart';
import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/repository/exchanged_record_repository.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:get_it/get_it.dart';

/// ほしいもの交換のユースケース
class ExchangeWishitemUseCase {
  /// コンストラクタ
  const ExchangeWishitemUseCase({required this.exchangedRecordListState});

  /// 交換履歴一覧のState
  final ExchangedRecordListState exchangedRecordListState;

  /// ほしいものを交換する
  Future<void> execute({required User user, required Wishitem wishitem}) async {
    final exchangedRecordRepository =
        GetIt.instance<ExchangedRecordRepository>();
    final userRepository = GetIt.instance<UserRepository>();

    // ユーザーのコイン残高を更新
    final updateUser = await userRepository.getUser(userId: user.id);
    await userRepository.updateUser(
      userId: user.id,
      user: updateUser.useFamilyCoin(amount: wishitem.price),
    );

    // 交換履歴を作成
    final now = DateTime.now();
    final exchangedRecord = ExchangedRecord(
      id: RecordId.generate(),
      userId: user.id,
      wishitemId: wishitem.id,
      exchangedCoins: wishitem.price,
      createdAt: now,
      updatedAt: now,
    );
    await exchangedRecordRepository.addExchangedRecord(
      exchangedRecord: exchangedRecord,
    );

    // 交換履歴一覧を更新
    await exchangedRecordListState.fetchExchangedRecordList();
  }
}
