import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchanged_record.freezed.dart';
part 'exchanged_record.g.dart';

/// ほしいもの交換履歴
@freezed
abstract class ExchangedRecord with _$ExchangedRecord {
  /// Constructor
  const factory ExchangedRecord({
    @RecordIdJsonConverter() required RecordId id,
    @WishitemIdJsonConverter() required WishitemId wishitemId,
    @UserIdJsonConverter() required UserId userId,
    @FamilyCoinJsonConverter() required FamilyCoin exchangedCoins,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ExchangedRecord;

  /// Constructor
  const ExchangedRecord._();

  /// fromJson
  factory ExchangedRecord.fromJson(Map<String, dynamic> json) =>
      _$ExchangedRecordFromJson(json);
}
