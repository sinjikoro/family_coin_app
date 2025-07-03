import 'package:family_coin/domain/value_object/avatar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Avatar', () {
    test('利用可能なアバター一覧が正しく取得される', () {
      final availableAvatars = Avatar.availableAvatars;
      expect(availableAvatars.length, 4);
      expect(availableAvatars[0], const AvatarNone());
      expect(availableAvatars[1], const AvatarBoy());
      expect(availableAvatars[2], const AvatarCat());
      expect(availableAvatars[3], const AvatarDog());
    });

    test('画像パスが正しく取得される', () {
      expect(const AvatarNone().imagePath, 'images/avatar_default.svg');
      expect(const AvatarBoy().imagePath, 'images/avatar_boy.svg');
      expect(const AvatarCat().imagePath, 'images/avatar_cat.svg');
      expect(const AvatarDog().imagePath, 'images/avatar_dog.svg');
    });

    test('文字列からアバターが正しく作成される', () {
      expect(Avatar.byName('none'), const AvatarNone());
      expect(Avatar.byName('boy'), const AvatarBoy());
      expect(Avatar.byName('cat'), const AvatarCat());
      expect(Avatar.byName('dog'), const AvatarDog());
    });

    test('toStringが正しく動作する', () {
      expect(const AvatarNone().toString(), 'none');
      expect(const AvatarBoy().toString(), 'boy');
      expect(const AvatarCat().toString(), 'cat');
      expect(const AvatarDog().toString(), 'dog');
    });

    test('等価性が正しく判定される', () {
      const avatar1 = AvatarBoy();
      const avatar2 = AvatarBoy();
      const avatar3 = AvatarCat();

      expect(avatar1, avatar2);
      expect(avatar1, isNot(avatar3));
    });

    test('ハッシュコードが正しく計算される', () {
      const avatar1 = AvatarBoy();
      const avatar2 = AvatarBoy();
      const avatar3 = AvatarCat();

      expect(avatar1.hashCode, avatar2.hashCode);
      expect(avatar1.hashCode, isNot(avatar3.hashCode));
    });
  });
}
