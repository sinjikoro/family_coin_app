import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/repository/wishitem_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/infrastructure/datasource/wishitem_datasource.dart';

/// ほしいものリポジトリの実装
class WishitemRepositoryImpl implements WishitemRepository {
  /// コンストラクタ
  const WishitemRepositoryImpl(this._dataSource);

  final WishitemDataSource _dataSource;

  @override
  Future<List<Wishitem>> getWishitemList({required UserId userId}) => _dataSource.getWishitemList(userId: userId);

  @override
  Future<Wishitem> getWishitem({required WishitemId wishitemId}) => _dataSource.getWishitem(wishitemId: wishitemId);

  @override
  Future<void> createWishitem(Wishitem wishitem) => _dataSource.createWishitem(wishitem);

  @override
  Future<void> updateWishitem({required WishitemId wishitemId, required Wishitem wishitem}) =>
      _dataSource.updateWishitem(wishitemId: wishitemId, wishitem: wishitem);

  @override
  Future<void> deleteWishitem({required WishitemId wishitemId}) => _dataSource.deleteWishitem(wishitemId: wishitemId);
}
