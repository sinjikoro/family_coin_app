import 'package:family_coin/domain/models/base/domain_model.dart';
import 'package:family_coin/domain/value_objects/approval_status.dart';
import 'package:family_coin/domain/value_objects/family_coin.dart';
import 'package:family_coin/domain/value_objects/id.dart';

/// タスクログ
class TaskLog extends DomainModel {
  /// Constructor
  const TaskLog({
    required this.id,
    required this.taskId,
    required this.userId,
    required this.approvalStatus,
    required this.earnedCoins,
    required this.earnedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  /// ID
  final Id id;

  /// タスクID
  final Id taskId;

  /// ユーザーID
  final Id userId;

  /// タスク
  final ApprovalStatus approvalStatus;

  /// 獲得コイン
  final FamilyCoin earnedCoins;

  /// 獲得日時
  final DateTime earnedAt;

  /// 作成日時
  final DateTime createdAt;

  /// 更新日時
  final DateTime updatedAt;
}
