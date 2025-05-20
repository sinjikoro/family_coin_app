import 'package:family_coin/domain/value_object/approval_status.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward_record.freezed.dart';
part 'reward_record.g.dart';

/// ほしいもの交換履歴
@freezed
abstract class RewardRecord with _$RewardRecord {
  /// Constructor
  const factory RewardRecord({
    @RecordIdJsonConverter() required RecordId id,
    @WishitemIdJsonConverter() required WishitemId wishitemId,
    @UserIdJsonConverter() required UserId userId,
    @FamilyCoinJsonConverter() required FamilyCoin exchangedCoins,
    @ApprovalStatusJsonConverter() required ApprovalStatus approvalStatus,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? exchangedAt,
  }) = _RewardRecord;

  /// Constructor
  const RewardRecord._();

  /// fromJson
  factory RewardRecord.fromJson(Map<String, dynamic> json) => _$RewardRecordFromJson(json);
}
