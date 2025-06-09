import 'package:family_coin/domain/error/domain_error.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FamilyCoin', () {
    test('正常な値でFamilyCoinを生成できる', () {
      const coin = FamilyCoin(100);
      expect(coin.value, 100);
    });

    test('FamilyCoin同士を加算できる', () {
      const coin1 = FamilyCoin(100);
      const coin2 = FamilyCoin(200);
      final result = coin1 + coin2;
      expect(result.value, 300);
    });

    test('FamilyCoin同士を減算できる', () {
      const coin1 = FamilyCoin(300);
      const coin2 = FamilyCoin(100);
      final result = coin1 - coin2;
      expect(result.value, 200);
    });

    test('FamilyCoin同士を乗算できる', () {
      const coin = FamilyCoin(100);
      const multiplier = 2;
      final result = coin * multiplier;
      expect(result.value, 200);
    });

    test('FamilyCoin同士を除算できる', () {
      const coin = FamilyCoin(100);
      const divisor = 2;
      final result = coin / divisor;
      expect(result.value, 50);
    });

    test('FamilyCoin同士を剰余できる', () {
      const coin = FamilyCoin(100);
      const divisor = 3;
      final result = coin % divisor;
      expect(result.value, 1);
    });

    test('符号反転は許可されていない', () {
      const coin = FamilyCoin(100);
      expect(() => -coin, throwsA(isA<DomainError>()));
    });

    test('FamilyCoin同士を比較できる', () {
      const coin1 = FamilyCoin(100);
      const coin2 = FamilyCoin(200);
      const coin3 = FamilyCoin(100);

      expect(coin1 < coin2, true);
      expect(coin2 > coin1, true);
      expect(coin1 <= coin3, true);
      expect(coin2 <= coin3, false);
      expect(coin1 >= coin3, true);
      expect(coin1 >= coin2, false);
      expect(coin1 == coin3, true);
      expect(coin1 != coin2, true);
    });
  });
}
