import 'package:family_coin/domain/models/base/domain_model.dart';
import 'package:family_coin/domain/value_objects/approval_status.dart';
import 'package:family_coin/domain/value_objects/family_coin.dart';
import 'package:family_coin/domain/value_objects/id.dart';
import 'package:flutter/cupertino.dart';

@immutable
/// ほしいもの交換履歴
class RewardRecord extends DomainModel {
  /// Constructor
  const RewardRecord({
    required this.id,
    required this.wishitemId,
    required this.userId,
    required this.exchangedCoins,
    required this.approvalStatus,
    required this.createdAt,
    required this.updatedAt,
    this.exchangedAt,
  });

  /// ID
  final Id id;

  /// ほしいものID
  final Id wishitemId;

  /// ユーザーID
  final Id userId;

  /// 名前
  final FamilyCoin exchangedCoins;

  /// 承認ステータス
  final ApprovalStatus approvalStatus;

  /// 交換日時
  final DateTime? exchangedAt;

  /// 作成日時
  final DateTime createdAt;

  /// 更新日時
  final DateTime updatedAt;
}
