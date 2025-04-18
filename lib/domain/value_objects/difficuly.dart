import 'package:family_coin/domain/value_objects/base/value_object.dart';

/// 難易度
sealed class Difficulty extends ValueObject {
  /// Constructor
  Difficulty();

  /// 簡単
  factory Difficulty.easy() => _Easy();

  /// 普通
  factory Difficulty.normal() => _Normal();

  /// 難しい
  factory Difficulty.hard() => _Hard();
}

/// 簡単
final class _Easy extends Difficulty {
  /// Constructor
  _Easy();

  /// 値
  @override
  String get value => 'easy';
}

/// 普通
final class _Normal extends Difficulty {
  /// Constructor
  _Normal();

  /// 値
  @override
  String get value => 'normal';
}

/// 難しい
final class _Hard extends Difficulty {
  /// Constructor
  _Hard();

  /// 値
  @override
  String get value => 'hard';
}
