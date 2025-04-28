import 'package:meta/meta.dart';

/// 値オブジェクト 基底クラス
@immutable
abstract class ValueObject<T> {
  /// Constructor
  const ValueObject();

  /// 値
  T get value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ValueObject<T> &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => '$runtimeType($value)';
}
