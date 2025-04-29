import 'package:family_coin/domain/value_object/base/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

const _unapproved = 'unapproved';
const _approved = 'approved';

/// 承認ステータス
sealed class ApprovalStatus extends ValueObject {
  /// Constructor
  const ApprovalStatus();

  /// 未承認
  factory ApprovalStatus.unapproved() => const _Unapproved();

  /// 承認
  factory ApprovalStatus.approved() => const _Approved();

  /// 承認ステータスの名前から承認ステータスを取得する
  factory ApprovalStatus.byName(String name) => switch (name) {
    _unapproved => const _Unapproved(),
    _approved => const _Approved(),
    _ => throw ArgumentError('Invalid approval status name: $name'),
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
  const _Unapproved();

  /// 値
  @override
  String get value => _unapproved;
}

/// 承認
final class _Approved extends ApprovalStatus {
  /// Constructor
  const _Approved();

  /// 値
  @override
  String get value => _approved;
}

/// 承認ステータスのJSONコンバーター
class ApprovalStatusJsonConverter implements JsonConverter<ApprovalStatus, String> {
  /// Constructor
  const ApprovalStatusJsonConverter();

  @override
  ApprovalStatus fromJson(String json) => ApprovalStatus.byName(json);

  @override
  String toJson(ApprovalStatus object) => object.value;
}
