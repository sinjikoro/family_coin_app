import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Wishitem', () {
    test('正常な値でWishitemを生成できる', () {
      final wishitem = Wishitem(
        wishItemId: WishitemId.generate(),
        userId: UserId.generate(),
        name: 'テストほしいもの',
        description: 'テストほしいものの説明',
        price: const FamilyCoin(100),
      );

      expect(wishitem.wishItemId, isA<WishitemId>());
      expect(wishitem.userId, isA<UserId>());
      expect(wishitem.name, 'テストほしいもの');
      expect(wishitem.description, 'テストほしいものの説明');
      expect(wishitem.price, const FamilyCoin(100));
    });

    test('WishitemをJSONに変換できる', () {
      final wishitem = Wishitem(
        wishItemId: WishitemId(1),
        userId: UserId(2),
        name: 'テストほしいもの',
        description: 'テストほしいものの説明',
        price: const FamilyCoin(100),
      );

      final json = wishitem.toJson();
      expect(json['wishItemId'], 1);
      expect(json['userId'], 2);
      expect(json['name'], 'テストほしいもの');
      expect(json['description'], 'テストほしいものの説明');
      expect(json['price'], 100);
    });

    test('JSONからWishitemを生成できる', () {
      final json = {
        'id': 1,
        'userId': 2,
        'name': 'テストほしいもの',
        'description': 'テストほしいものの説明',
        'price': 100,
      };

      final wishitem = Wishitem.fromJson(json);
      expect(wishitem.wishItemId.value, 1);
      expect(wishitem.userId.value, 2);
      expect(wishitem.name, 'テストほしいもの');
      expect(wishitem.description, 'テストほしいものの説明');
      expect(wishitem.price, const FamilyCoin(100));
    });

    test('Wishitemをコピーできる', () {
      final wishitem = Wishitem(
        wishItemId: WishitemId.generate(),
        userId: UserId.generate(),
        name: 'テストほしいもの',
        description: 'テストほしいものの説明',
        price: const FamilyCoin(100),
      );

      final copiedWishitem = wishitem.copyWith(
        name: 'コピーされたほしいもの',
        price: const FamilyCoin(200),
      );

      expect(copiedWishitem.wishItemId, wishitem.wishItemId);
      expect(copiedWishitem.userId, wishitem.userId);
      expect(copiedWishitem.name, 'コピーされたほしいもの');
      expect(copiedWishitem.description, wishitem.description);
      expect(copiedWishitem.price, const FamilyCoin(200));
    });
  });
}
