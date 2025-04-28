import 'package:family_coin/domain/model/task/task_detail.dart';
import 'package:family_coin/domain/value_object/approval_status.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

/// タスク
@freezed
abstract class Task with _$Task {
  /// Constructor
  const factory Task({
    @IdJsonConverter() required Id id,
    required String name,
    @IdJsonConverter() required Id userId,
    @FamilyCoinJsonConverter() required FamilyCoin earnCoins,
    @ApprovalStatusJsonConverter() required ApprovalStatus registrationStatus,
    required TaskDetail detail,
  }) = _Task;

  /// Constructor
  const Task._();

  /// fromJson
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
