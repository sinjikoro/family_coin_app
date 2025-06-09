import 'package:family_coin/domain/value_object/id.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Id', () {
    test('正常な値でIdを生成できる', () {
      final id = Id<int>(1);
      expect(id.value, 1);
    });

    test('負の値でIdを生成するとエラーになる', () {
      expect(() => Id<int>(-1), throwsArgumentError);
    });

    test('同じ値のIdは等しい', () {
      final id1 = Id<int>(1);
      final id2 = Id<int>(1);
      expect(id1, id2);
    });

    test('異なる値のIdは等しくない', () {
      final id1 = Id<int>(1);
      final id2 = Id<int>(2);
      expect(id1, isNot(id2));
    });

    test('異なる型のIdは等しくない', () {
      final id1 = Id<int>(1);
      final id2 = Id<UserId>(1);
      expect(id1, isNot(id2));
    });
  });

  group('UserId', () {
    test('正常な値でUserIdを生成できる', () {
      final id = UserId(1);
      expect(id.value, 1);
    });

    test('UserIdを生成できる', () {
      final id = UserId.generate();
      expect(id.value, isPositive);
    });
  });

  group('TaskId', () {
    test('正常な値でTaskIdを生成できる', () {
      final id = TaskId(1);
      expect(id.value, 1);
    });

    test('TaskIdを生成できる', () {
      final id = TaskId.generate();
      expect(id.value, isPositive);
    });
  });

  group('WishitemId', () {
    test('正常な値でWishitemIdを生成できる', () {
      final id = WishitemId(1);
      expect(id.value, 1);
    });

    test('WishitemIdを生成できる', () {
      final id = WishitemId.generate();
      expect(id.value, isPositive);
    });
  });

  group('RecordId', () {
    test('正常な値でRecordIdを生成できる', () {
      final id = LogId(1);
      expect(id.value, 1);
    });

    test('RecordIdを生成できる', () {
      final id = LogId.generate();
      expect(id.value, isPositive);
    });
  });

  group('IdJsonConverter', () {
    group('UserIdJsonConverter', () {
      const converter = UserIdJsonConverter();

      test('fromJsonでUserIdを生成できる', () {
        final id = converter.fromJson(1);
        expect(id, isA<UserId>());
        expect(id.value, 1);
      });

      test('toJsonでintに変換できる', () {
        final id = UserId(1);
        expect(converter.toJson(id), 1);
      });
    });

    group('TaskIdJsonConverter', () {
      const converter = TaskIdJsonConverter();

      test('fromJsonでTaskIdを生成できる', () {
        final id = converter.fromJson(1);
        expect(id, isA<TaskId>());
        expect(id.value, 1);
      });

      test('toJsonでintに変換できる', () {
        final id = TaskId(1);
        expect(converter.toJson(id), 1);
      });
    });

    group('WishitemIdJsonConverter', () {
      const converter = WishitemIdJsonConverter();

      test('fromJsonでWishitemIdを生成できる', () {
        final id = converter.fromJson(1);
        expect(id, isA<WishitemId>());
        expect(id.value, 1);
      });

      test('toJsonでintに変換できる', () {
        final id = WishitemId(1);
        expect(converter.toJson(id), 1);
      });
    });

    group('LogIdJsonConverter', () {
      const converter = LogIdJsonConverter();

      test('fromJsonでLogIdを生成できる', () {
        final id = converter.fromJson(1);
        expect(id, isA<LogId>());
        expect(id.value, 1);
      });

      test('toJsonでintに変換できる', () {
        final id = LogId(1);
        expect(converter.toJson(id), 1);
      });
    });
  });
}
