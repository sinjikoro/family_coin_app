import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/repository/wishitem_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:mocktail/mocktail.dart';

/// MockWishitemRepository
class MockWishitemRepository extends Mock implements WishitemRepository {
  List<Wishitem> dummyWishitemList = [];

  @override
  Future<List<Wishitem>> getWishitemList({required UserId userId}) async =>
      dummyWishitemList;

  @override
  Future<Wishitem> getWishitem({required WishitemId wishitemId}) async =>
      dummyWishitemList.firstWhere((element) => element.id == wishitemId);

  @override
  Future<void> createWishitem(Wishitem wishitem) async =>
      dummyWishitemList.add(wishitem);

  @override
  Future<void> updateWishitem({
    required WishitemId wishitemId,
    required Wishitem wishitem,
  }) async {
    final index = dummyWishitemList.indexWhere(
      (element) => element.id == wishitemId,
    );
    dummyWishitemList[index] = wishitem;
  }

  @override
  Future<void> deleteWishitem({required WishitemId wishitemId}) async {
    final index = dummyWishitemList.indexWhere(
      (element) => element.id == wishitemId,
    );
    dummyWishitemList.removeAt(index);
  }
}
