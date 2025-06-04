import 'package:family_coin/domain/error/domain_error.dart';
import 'package:family_coin/domain/error/error_code.dart';
import 'package:family_coin/domain/value_object/base/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// ファミリーコイン
class FamilyCoin extends ValueObject<int> {
  /// Constructor
  const FamilyCoin(this.value) : assert(value >= 0, 'ファミリーコインは0以上である必要があります');

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
  FamilyCoin operator -(FamilyCoin other) {
    final result = value - other.value;
    if (result < 0) {
      throw const DomainError(code: ErrorCode.familyCoinNegative);
    }
    return FamilyCoin(result);
  }

  /// 乗算
  FamilyCoin operator *(int other) {
    if (other < 0) {
      throw const DomainError(code: ErrorCode.familyCoinNegativeMultiplication);
    }
    return FamilyCoin(value * other);
  }

  /// 除算
  FamilyCoin operator /(int other) {
    if (other <= 0) {
      throw const DomainError(code: ErrorCode.familyCoinInvalidDivision);
    }
    return FamilyCoin(value ~/ other);
  }

  /// 剰余
  FamilyCoin operator %(int other) {
    if (other <= 0) {
      throw const DomainError(code: ErrorCode.familyCoinInvalidModulo);
    }
    return FamilyCoin(value % other);
  }

  /// 符号反転
  FamilyCoin operator -() {
    throw const DomainError(code: ErrorCode.familyCoinSignInversion);
  }

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
