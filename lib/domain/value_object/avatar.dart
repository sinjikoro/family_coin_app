import 'package:family_coin/domain/value_object/base/value_object.dart';

const _none = 'none';
const _boy = 'boy';
const _cat = 'cat';
const _dog = 'dog';

/// アバター
sealed class Avatar extends ValueObject<String> {
  /// コンストラクタ
  const Avatar();

  /// 名前からアバターを取得
  factory Avatar.byName(String name) => switch (name) {
    _none => const AvatarNone(),
    _boy => const AvatarBoy(),
    _cat => const AvatarCat(),
    _dog => const AvatarDog(),
    _ => const AvatarNone(),
  };

  /// 画像パス
  String get imagePath;

  /// 利用可能なアバター一覧
  static List<Avatar> get availableAvatars => const [
    AvatarNone(),
    AvatarBoy(),
    AvatarCat(),
    AvatarDog(),
  ];
}

/// デフォルト
final class AvatarNone extends Avatar {
  /// Constructor
  const AvatarNone();

  /// 名前
  @override
  String get value => _none;

  /// 画像パス
  @override
  String get imagePath => 'assets/images/avatar/default.svg';
}

/// 男の子
final class AvatarBoy extends Avatar {
  /// Constructor
  const AvatarBoy();

  /// 名前
  @override
  String get value => _boy;

  /// 画像パス
  @override
  String get imagePath => 'assets/images/avatar/boy.svg';
}

/// 猫
final class AvatarCat extends Avatar {
  /// Constructor
  const AvatarCat();

  /// 名前
  @override
  String get value => _cat;

  /// 画像パス
  @override
  String get imagePath => 'assets/images/avatar/cat.svg';
}

/// 犬
final class AvatarDog extends Avatar {
  /// Constructor
  const AvatarDog();

  /// 名前
  @override
  String get value => _dog;

  /// 画像パス
  @override
  String get imagePath => 'assets/images/avatar/dog.svg';
}
