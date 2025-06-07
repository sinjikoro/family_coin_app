import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/repository/wishitem_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:get_it/get_it.dart';

/// ほしいもの取得のユースケース
class GetWishitemUseCase {
  /// コンストラクタ
  const GetWishitemUseCase();

  /// ほしいものを取得する
  Future<Wishitem> execute(WishitemId wishitemId) async {
    final repository = GetIt.instance<WishitemRepository>();
    return await repository.getWishitem(wishitemId: wishitemId);
  }
}
