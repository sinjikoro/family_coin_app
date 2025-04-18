import 'package:family_coin/domain/models/base/domain_model.dart';
import 'package:family_coin/domain/models/wishitem_detail.dart';
import 'package:family_coin/domain/value_objects/approval_status.dart';
import 'package:family_coin/domain/value_objects/family_coin.dart';
import 'package:family_coin/domain/value_objects/id.dart';
import 'package:meta/meta.dart';

/// ほしいもの
@immutable
class Wishitem extends DomainModel {
  /// Constructor
  const Wishitem({
    required this.id,
    required this.name,
    required this.userId,
    required this.approvalStatus,
    required this.price,
    this.detail = const WishitemDetail(),
  });

  /// ID
  final Id id;

  /// 名前
  final String name;

  /// ユーザーID
  final Id userId;

  /// 承認ステータス
  final ApprovalStatus approvalStatus;

  /// 価格
  final FamilyCoin price;

  /// 詳細
  final WishitemDetail detail;
}
