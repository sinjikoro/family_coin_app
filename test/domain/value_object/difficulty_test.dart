import 'package:family_coin/domain/value_object/difficuly.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Difficulty', () {
    test('簡単な難易度を生成できる', () {
      const difficulty = Difficulty.easy;
      expect(difficulty.value, 'easy');
    });

    test('普通の難易度を生成できる', () {
      const difficulty = Difficulty.normal;
      expect(difficulty.value, 'normal');
    });

    test('難しい難易度を生成できる', () {
      const difficulty = Difficulty.hard;
      expect(difficulty.value, 'hard');
    });

    test('同じ難易度のDifficultyは等しい', () {
      const difficulty1 = Difficulty.easy;
      const difficulty2 = Difficulty.easy;
      expect(difficulty1, difficulty2);
    });

    test('異なる難易度のDifficultyは等しくない', () {
      const difficulty1 = Difficulty.easy;
      const difficulty2 = Difficulty.hard;
      expect(difficulty1, isNot(difficulty2));
    });

    test('不正な値でDifficultyを生成するとエラーになる', () {
      expect(() => Difficulty.byName('invalid'), throwsArgumentError);
    });
  });
}
