import 'package:family_coin/domain/value_object/base/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

const _earn = 'earn';
const _exchange = 'exchange';

/// FamilyCoinの取引タイプ
sealed class TransactionType extends ValueObject {
  const TransactionType();

  factory TransactionType.byName(String name) => switch (name) {
    _earn => const _Earn(),
    _exchange => const _Exchange(),
    _ => throw ArgumentError('Invalid transaction type: $name'),
  };

  /// 付与
  static const earn = _Earn();

  /// 交換
  static const exchange = _Exchange();
}

/// 付与
final class _Earn extends TransactionType {
  const _Earn();

  /// 値
  @override
  String get value => _earn;
}

/// 交換
final class _Exchange extends TransactionType {
  const _Exchange();

  /// 値
  @override
  String get value => _exchange;
}

/// FamilyCoinの取引タイプのJSONコンバーター
class TransactionTypeJsonConverter
    implements JsonConverter<TransactionType, String> {
  /// Constructor
  const TransactionTypeJsonConverter();

  @override
  TransactionType fromJson(String json) => TransactionType.byName(json);

  @override
  String toJson(TransactionType object) => object.value;
}
