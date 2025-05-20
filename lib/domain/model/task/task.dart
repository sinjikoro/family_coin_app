import 'package:family_coin/domain/value_object/approval_status.dart';
import 'package:family_coin/domain/value_object/difficuly.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

/// タスクのドメインモデル
@freezed
abstract class Task with _$Task {
  /// constructor
  const factory Task({
    @TaskIdJsonConverter() required TaskId id,
    required String name,
    @UserIdJsonConverter() required UserId userId,
    @ApprovalStatusJsonConverter() required ApprovalStatus registrationStatus,
    @FamilyCoinJsonConverter() required FamilyCoin earnCoins,
    @Default('') String description,
    @DifficultyJsonConverter() @Default(Difficulty.normal) Difficulty difficulty,
  }) = _Task;

  /// Constructor
  const Task._();

  /// 初期化
  factory Task.initial(UserId userId) => Task(
    id: const TaskId.unassigned(),
    name: '',
    userId: userId,
    registrationStatus: ApprovalStatus.unapproved(),
    earnCoins: const FamilyCoin(0),
  );

  /// JSONからTaskを作成
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
