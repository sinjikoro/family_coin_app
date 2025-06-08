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
    @WishitemIdJsonConverter() required WishitemId id,
    required String name,
    @UserIdJsonConverter() required UserId userId,
    @FamilyCoinJsonConverter() required FamilyCoin price,
    required String description,
    Uri? url,
  }) = _Wishitem;

  /// Constructor
  const Wishitem._();

  /// 初期化
  factory Wishitem.initial(UserId userId) => Wishitem(
    id: const WishitemId.unassigned(),
    name: '',
    userId: userId,
    price: const FamilyCoin(0),
    description: '',
  );

  /// fromJson
  factory Wishitem.fromJson(Map<String, dynamic> json) =>
      _$WishitemFromJson(json);
}
