import 'package:family_coin/domain/value_object/difficuly.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/domain/value_object/recurrence_rule.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

/// タスクのドメインモデル
@freezed
abstract class Task with _$Task {
  /// constructor
  const factory Task({
    @TaskIdJsonConverter() required TaskId taskId,
    required String name,
    @UserIdJsonConverter() required UserId userId,
    @FamilyCoinJsonConverter() required FamilyCoin earnCoins,
    @Default('') String description,
    @DifficultyJsonConverter()
    @Default(Difficulty.normal)
    Difficulty difficulty,
    @RRuleJsonConverter() RRule? recurrenceRule,
  }) = _Task;

  /// Constructor
  const Task._();

  /// 初期化
  factory Task.initial(UserId userId) => Task(
    taskId: const TaskId.unassigned(),
    name: '',
    userId: userId,
    earnCoins: const FamilyCoin(0),
  );

  /// JSONからTaskを作成
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
