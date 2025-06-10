import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('User', () {
    test('正常な値でUserを生成できる', () {
      final user = User(
        userId: UserId.generate(),
        name: 'テストユーザー',
        familyCoinBalance: const FamilyCoin(1000),
      );

      expect(user.userId, isA<UserId>());
      expect(user.name, 'テストユーザー');
      expect(user.familyCoinBalance, const FamilyCoin(1000));
    });

    test('UserをJSONに変換できる', () {
      final user = User(
        userId: UserId(1),
        name: 'テストユーザー',
        familyCoinBalance: const FamilyCoin(1000),
      );

      final json = user.toJson();
      expect(json['userId'], 1);
      expect(json['name'], 'テストユーザー');
      expect(json['familyCoinBalance'], 1000);
    });

    test('JSONからUserを生成できる', () {
      final json = {'id': 1, 'name': 'テストユーザー', 'familyCoinBalance': 1000};

      final user = User.fromJson(json);
      expect(user.userId.value, 1);
      expect(user.name, 'テストユーザー');
      expect(user.familyCoinBalance, const FamilyCoin(1000));
    });

    test('Userをコピーできる', () {
      final user = User(
        userId: UserId.generate(),
        name: 'テストユーザー',
        familyCoinBalance: const FamilyCoin(1000),
      );

      final copiedUser = user.copyWith(
        name: 'コピーされたユーザー',
        familyCoinBalance: const FamilyCoin(2000),
      );

      expect(copiedUser.userId, user.userId);
      expect(copiedUser.name, 'コピーされたユーザー');
      expect(copiedUser.familyCoinBalance, const FamilyCoin(2000));
    });
  });
}
