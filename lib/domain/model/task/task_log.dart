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
    @RecordIdJsonConverter() required RecordId id,
    @TaskIdJsonConverter() required TaskId taskId,
    @UserIdJsonConverter() required UserId userId,
    @FamilyCoinJsonConverter() required FamilyCoin earnedCoins,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TaskLog;

  /// Constructor
  const TaskLog._();

  /// fromJson
  factory TaskLog.fromJson(Map<String, dynamic> json) =>
      _$TaskLogFromJson(json);
}
