import 'package:family_coin/domain/value_object/base/value_object.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ValueObject', () {
    test('同じ値のValueObjectは等しい', () {
      const vo1 = TestValueObject(1);
      const vo2 = TestValueObject(1);
      expect(vo1, equals(vo2));
      expect(vo1.hashCode, equals(vo2.hashCode));
    });

    test('異なる値のValueObjectは等しくない', () {
      const vo1 = TestValueObject(1);
      const vo2 = TestValueObject(2);
      expect(vo1, isNot(equals(vo2)));
      expect(vo1.hashCode, isNot(equals(vo2.hashCode)));
    });
  });
}

/// テスト用のValueObject実装
class TestValueObject extends ValueObject<int> {
  /// コンストラクタ
  const TestValueObject(this.value);

  @override
  final int value;
}
