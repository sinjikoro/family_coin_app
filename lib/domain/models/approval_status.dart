/// 承認ステータス
sealed class ApprovalStatus {
  /// Constructor
  const ApprovalStatus();

  /// 承認
  ApprovalStatus approve() => switch (this) {
    Pending() => const Approved(),
    _ => this,
  };

  /// 承認されているか
  bool get isApproved => switch (this) {
    Approved() => true,
    _ => false,
  };
}

/// 未承認
final class Pending extends ApprovalStatus {
  /// Constructor
  const Pending();
}

/// 承認
final class Approved extends ApprovalStatus {
  /// Constructor
  const Approved();
}
