import 'package:family_coin/domain/models/wishitem/wishitem_detail.dart';
import 'package:family_coin/domain/value_objects/approval_status.dart';
import 'package:family_coin/domain/value_objects/family_coin.dart';
import 'package:family_coin/domain/value_objects/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishitem.freezed.dart';
part 'wishitem.g.dart';

/// ほしいもの
@freezed
abstract class Wishitem with _$Wishitem {
  /// Constructor
  const factory Wishitem({
    @IdJsonConverter() required Id id,
    required String name,
    @IdJsonConverter() required Id userId,
    @ApprovalStatusJsonConverter() required ApprovalStatus approvalStatus,
    @FamilyCoinJsonConverter() required FamilyCoin price,
    required WishitemDetail detail,
  }) = _Wishitem;

  /// Constructor
  const Wishitem._();

  /// fromJson
  factory Wishitem.fromJson(Map<String, dynamic> json) =>
      _$WishitemFromJson(json);
}
