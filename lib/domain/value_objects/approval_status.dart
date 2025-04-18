import 'package:family_coin/domain/value_objects/base/value_object.dart';

/// 承認ステータス
sealed class ApprovalStatus extends ValueObject {
  /// Constructor
  ApprovalStatus();

  /// 承認
  ApprovalStatus approve() => switch (this) {
    Unapproved() => Approved(),
    _ => this,
  };

  /// 承認されているか
  bool get isApproved => switch (this) {
    Approved() => true,
    _ => false,
  };
}

/// 未承認
final class Unapproved extends ApprovalStatus {
  /// Constructor
  Unapproved();

  /// 値
  @override
  String get value => 'unapproved';
}

/// 承認
final class Approved extends ApprovalStatus {
  /// Constructor
  Approved();

  /// 値
  @override
  String get value => 'approved';
}
