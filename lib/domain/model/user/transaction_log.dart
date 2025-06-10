import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/domain/value_object/transaction_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_log.freezed.dart';
part 'transaction_log.g.dart';

/// ユーザーの取引ログ
@freezed
abstract class TransactionLog with _$TransactionLog {
  /// Constructor
  const factory TransactionLog({
    @LogIdJsonConverter() required LogId transactionLogId,
    @UserIdJsonConverter() required UserId userId,
    @TransactionTypeJsonConverter() required TransactionType type,
    @FamilyCoinJsonConverter() required FamilyCoin amount,
    required String description,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TransactionLog;

  /// Constructor
  const TransactionLog._();

  /// fromJson
  factory TransactionLog.fromJson(Map<String, dynamic> json) =>
      _$TransactionLogFromJson(json);
}
