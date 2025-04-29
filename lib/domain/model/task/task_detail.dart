import 'package:family_coin/domain/value_object/difficuly.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_detail.freezed.dart';
part 'task_detail.g.dart';

/// タスク詳細
@freezed
abstract class TaskDetail with _$TaskDetail {
  /// Constructor
  const factory TaskDetail({
    @Default('') String description,
    @DifficultyJsonConverter() @Default(Difficulty.normal) Difficulty difficulty,
  }) = _TaskDetail;

  /// Constructor
  const TaskDetail._();

  /// fromJson
  factory TaskDetail.fromJson(Map<String, dynamic> json) => _$TaskDetailFromJson(json);
}
