import 'package:family_coin/application/provider/wishitem_list_state.dart';
import 'package:family_coin/domain/repository/wishitem_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:get_it/get_it.dart';

/// ほしいものを削除するユースケース
class DeleteWishitemUseCase {
  /// コンストラクタ
  const DeleteWishitemUseCase({required this.wishitemListState});

  /// ほしいもの一覧のState
  final WishitemListState wishitemListState;

  /// ほしいものを削除する
  Future<void> execute({required WishitemId wishitemId}) async {
    final repository = GetIt.instance<WishitemRepository>();
    await repository.deleteWishitem(wishitemId: wishitemId);
    await wishitemListState.fetch();
  }
}
