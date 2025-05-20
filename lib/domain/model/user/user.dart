import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// ユーザー
@freezed
abstract class User with _$User {
  /// Constructor
  const factory User({
    @UserIdJsonConverter() required UserId id,
    required String name,
    @FamilyCoinJsonConverter() required FamilyCoin familyCoinBalance,
  }) = _User;

  /// Constructor
  const User._();

  /// 初期化
  factory User.initial() => const User(id: UserId.unassigned(), name: '', familyCoinBalance: FamilyCoin(0));

  /// fromJson
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
