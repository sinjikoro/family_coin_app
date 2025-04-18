import 'package:family_coin/domain/models/base/domain_model.dart';
import 'package:family_coin/domain/value_objects/approval_status.dart';
import 'package:family_coin/domain/value_objects/family_coin.dart';
import 'package:family_coin/domain/value_objects/id.dart';
import 'package:family_coin/presentation/ui/task/pages/task_detail.dart';

/// タスク
class Task extends DomainModel {
  /// Constructor
  const Task({
    required this.id,
    required this.name,
    required this.userId,
    required this.earnCoins,
    required this.registrationStatus,
    required this.detail,
  });

  /// ID
  final Id id;

  /// 名前
  final String name;

  /// 説明
  final Id userId;

  /// 報酬
  final FamilyCoin earnCoins;

  /// 承認ステータス
  final ApprovalStatus registrationStatus;

  /// 詳細
  final TaskDetail detail;
}
