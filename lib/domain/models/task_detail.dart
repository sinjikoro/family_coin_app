import 'package:family_coin/domain/models/base/domain_model.dart';
import 'package:family_coin/domain/value_objects/difficuly.dart';

/// タスク詳細
class TaskDetail extends DomainModel {
  /// Constructor
  TaskDetail({this.description = '', difficulty})
    : difficulty = difficulty ?? Difficulty.normal();

  /// 説明
  final String description;

  /// 報酬
  final Difficulty difficulty;
}
