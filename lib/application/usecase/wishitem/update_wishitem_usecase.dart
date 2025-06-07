import 'package:family_coin/application/provider/wishitem_list_state.dart';
import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/repository/wishitem_repository.dart';
import 'package:get_it/get_it.dart';

/// ほしいものを更新するユースケース
class UpdateWishitemUseCase {
  /// コンストラクタ
  const UpdateWishitemUseCase({required this.wishitemListState});

  /// ほしいもの一覧のState
  final WishitemListState wishitemListState;

  /// ほしいものを更新する
  Future<void> execute({required Wishitem wishitem}) async {
    final repository = GetIt.instance<WishitemRepository>();
    await repository.updateWishitem(wishitem: wishitem);
    await wishitemListState.fetchWishitemList();
  }
}
