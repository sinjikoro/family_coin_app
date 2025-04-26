import 'package:family_coin/domain/value_objects/base/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

const _easy = 'easy';
const _normal = 'normal';
const _hard = 'hard';

/// 難易度
sealed class Difficulty extends ValueObject {
  /// Constructor
  const Difficulty();

  /// 難易度の名前から難易度を取得する
  factory Difficulty.byName(String name) => switch (name) {
    _easy => const _Easy(),
    _normal => const _Normal(),
    _hard => const _Hard(),
    _ => throw ArgumentError('Invalid difficulty name: $name'),
  };

  /// 簡単
  static const easy = _Easy();

  /// 普通
  static const normal = _Normal();

  /// 難しい
  static const hard = _Hard();
}

/// 簡単
final class _Easy extends Difficulty {
  /// Constructor
  const _Easy();

  /// 値
  @override
  String get value => _easy;
}

/// 普通
final class _Normal extends Difficulty {
  /// Constructor
  const _Normal();

  /// 値
  @override
  String get value => _normal;
}

/// 難しい
final class _Hard extends Difficulty {
  /// Constructor
  const _Hard();

  /// 値
  @override
  String get value => _hard;
}

/// 難易度のJSONコンバーター
class DifficultyJsonConverter implements JsonConverter<Difficulty, String> {
  /// Constructor
  const DifficultyJsonConverter();

  @override
  Difficulty fromJson(String json) => Difficulty.byName(json);

  @override
  String toJson(Difficulty object) => object.value;
}
