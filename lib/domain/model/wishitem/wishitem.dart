import 'package:family_coin/domain/value_object/approval_status.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
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
    required String description,
    Uri? url,
  }) = _Wishitem;

  /// Constructor
  const Wishitem._();

  /// 初期化
  factory Wishitem.initial(Id userId) => Wishitem(
    id: const Id.unassigned(),
    name: '',
    userId: userId,
    approvalStatus: ApprovalStatus.unapproved(),
    price: const FamilyCoin(0),
    description: '',
  );

  /// fromJson
  factory Wishitem.fromJson(Map<String, dynamic> json) => _$WishitemFromJson(json);
}
