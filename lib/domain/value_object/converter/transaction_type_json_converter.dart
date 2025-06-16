import 'package:family_coin/domain/value_object/transaction_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
