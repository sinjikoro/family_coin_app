import 'package:family_coin/domain/value_object/approval_status.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_log.freezed.dart';
part 'task_log.g.dart';

/// タスクログ
@freezed
abstract class TaskLog with _$TaskLog {
  /// Constructor
  const factory TaskLog({
    @IdJsonConverter() required Id id,
    @IdJsonConverter() required Id taskId,
    @IdJsonConverter() required Id userId,
    @ApprovalStatusJsonConverter() required ApprovalStatus approvalStatus,
    @FamilyCoinJsonConverter() required FamilyCoin earnedCoins,
    required DateTime earnedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TaskLog;

  /// Constructor
  const TaskLog._();

  /// fromJson
  factory TaskLog.fromJson(Map<String, dynamic> json) => _$TaskLogFromJson(json);
}
