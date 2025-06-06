import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/value_object/approval_status.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Wishitem', () {
    test('正常な値でWishitemを生成できる', () {
      final wishitem = Wishitem(
        id: WishitemId.generate(),
        userId: UserId.generate(),
        name: 'テストほしいもの',
        description: 'テストほしいものの説明',
        price: const FamilyCoin(100),
        approvalStatus: ApprovalStatus.unapproved(),
      );

      expect(wishitem.id, isA<WishitemId>());
      expect(wishitem.userId, isA<UserId>());
      expect(wishitem.name, 'テストほしいもの');
      expect(wishitem.description, 'テストほしいものの説明');
      expect(wishitem.price, const FamilyCoin(100));
      expect(wishitem.approvalStatus, ApprovalStatus.unapproved());
    });

    test('WishitemをJSONに変換できる', () {
      final wishitem = Wishitem(
        id: WishitemId(1),
        userId: UserId(2),
        name: 'テストほしいもの',
        description: 'テストほしいものの説明',
        price: const FamilyCoin(100),
        approvalStatus: ApprovalStatus.unapproved(),
      );

      final json = wishitem.toJson();
      expect(json['id'], 1);
      expect(json['userId'], 2);
      expect(json['name'], 'テストほしいもの');
      expect(json['description'], 'テストほしいものの説明');
      expect(json['price'], 100);
      expect(json['approvalStatus'], ApprovalStatus.unapproved().value);
    });

    test('JSONからWishitemを生成できる', () {
      final json = {
        'id': 1,
        'userId': 2,
        'name': 'テストほしいもの',
        'description': 'テストほしいものの説明',
        'price': 100,
        'approvalStatus': ApprovalStatus.unapproved().value,
      };

      final wishitem = Wishitem.fromJson(json);
      expect(wishitem.id.value, 1);
      expect(wishitem.userId.value, 2);
      expect(wishitem.name, 'テストほしいもの');
      expect(wishitem.description, 'テストほしいものの説明');
      expect(wishitem.price, const FamilyCoin(100));
      expect(wishitem.approvalStatus, ApprovalStatus.unapproved());
    });

    test('Wishitemをコピーできる', () {
      final wishitem = Wishitem(
        id: WishitemId.generate(),
        userId: UserId.generate(),
        name: 'テストほしいもの',
        description: 'テストほしいものの説明',
        price: const FamilyCoin(100),
        approvalStatus: ApprovalStatus.unapproved(),
      );

      final copiedWishitem = wishitem.copyWith(name: 'コピーされたほしいもの', price: const FamilyCoin(200));

      expect(copiedWishitem.id, wishitem.id);
      expect(copiedWishitem.userId, wishitem.userId);
      expect(copiedWishitem.name, 'コピーされたほしいもの');
      expect(copiedWishitem.description, wishitem.description);
      expect(copiedWishitem.price, const FamilyCoin(200));
      expect(copiedWishitem.approvalStatus, wishitem.approvalStatus);
    });
  });
}
