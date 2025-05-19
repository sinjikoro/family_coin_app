import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/value_object/id.dart';

/// ほしいものリポジトリ
abstract class WishitemRepository {
  /// ほしいもの一覧を取得する
  Future<List<Wishitem>> getWishitemList({required Id userId});

  /// ほしいものを取得する
  Future<Wishitem> getWishitem({required Id wishitemId});

  /// ほしいものを作成する
  Future<void> createWishitem(Wishitem wishitem);

  /// ほしいものを更新する
  Future<void> updateWishitem({required Id wishitemId, required Wishitem wishitem});

  /// ほしいものを削除する
  Future<void> deleteWishitem({required Id wishitemId});
}
