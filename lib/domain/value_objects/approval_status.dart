import 'package:family_coin/domain/value_objects/base/value_object.dart';

/// 承認ステータス
sealed class ApprovalStatus extends ValueObject {
  /// Constructor
  ApprovalStatus();

  /// 未承認
  factory ApprovalStatus.unapproved() => _Unapproved();

  /// 承認
  factory ApprovalStatus.approved() => _Approved();

  /// 等価
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ApprovalStatus) return false;
    return value == other.value;
  }

  /// ハッシュコード
  @override
  int get hashCode => value.hashCode;

  /// 承認
  ApprovalStatus approve() => switch (this) {
    _Unapproved() => _Approved(),
    _ => this,
  };

  /// 承認されているか
  bool get isApproved => switch (this) {
    _Approved() => true,
    _ => false,
  };
}

/// 未承認
final class _Unapproved extends ApprovalStatus {
  /// Constructor
  _Unapproved();

  /// 値
  @override
  String get value => 'unapproved';
}

/// 承認
final class _Approved extends ApprovalStatus {
  /// Constructor
  _Approved();

  /// 値
  @override
  String get value => 'approved';
}
