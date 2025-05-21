import 'package:family_coin/domain/value_object/base/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// ファミリーコイン
class FamilyCoin extends ValueObject<int> {
  /// Constructor
  const FamilyCoin(this.value);

  /// 値
  @override
  final int value;

  @override
  bool operator ==(Object other) {
    if (other is! FamilyCoin) return false;
    return value == other.value;
  }

  /// 加算
  FamilyCoin operator +(FamilyCoin other) => FamilyCoin(value + other.value);

  /// 減算
  FamilyCoin operator -(FamilyCoin other) => FamilyCoin(value - other.value);

  /// 乗算
  FamilyCoin operator *(int other) => FamilyCoin(value * other);

  /// 除算
  FamilyCoin operator /(int other) => FamilyCoin(value ~/ other);

  /// 剰余
  FamilyCoin operator %(int other) => FamilyCoin(value % other);

  /// 符号反転
  FamilyCoin operator -() => FamilyCoin(-value);

  /// 比較
  bool operator <(FamilyCoin other) => value < other.value;

  /// 比較
  bool operator <=(FamilyCoin other) => value <= other.value;

  /// 比較
  bool operator >(FamilyCoin other) => value > other.value;

  /// 比較
  bool operator >=(FamilyCoin other) => value >= other.value;

  @override
  int get hashCode => value.hashCode;
}

/// ファミリーコインのJSONコンバーター
class FamilyCoinJsonConverter implements JsonConverter<FamilyCoin, int> {
  /// Constructor
  const FamilyCoinJsonConverter();

  @override
  FamilyCoin fromJson(int json) => FamilyCoin(json);

  @override
  int toJson(FamilyCoin object) => object.value;
}
