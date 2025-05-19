import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/value_object/id.dart';

/// ほしいものデータソース
abstract class WishitemDataSource {
  /// ほしいものを取得する
  Future<Wishitem> getWishitem({required Id wishitemId});

  /// ほしいもの一覧を取得する
  Future<List<Wishitem>> getWishitemList({required Id userId});

  /// ほしいものを作成する
  Future<void> createWishitem(Wishitem wishitem);

  /// ほしいものを更新する
  Future<void> updateWishitem({required Id wishitemId, required Wishitem wishitem});

  /// ほしいものを削除する
  Future<void> deleteWishitem({required Id wishitemId});
}
