import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// ユーザー
@Freezed(fromJson: true, toJson: true)
abstract class User with _$User {
  /// Constructor
  const factory User({
    @IdJsonConverter() required Id id,
    required String name,
    @FamilyCoinJsonConverter() required FamilyCoin familyCoin,
  }) = _User;

  /// Constructor
  const User._();

  /// 初期化
  factory User.initial() =>
      const User(id: Id(0), name: '', familyCoin: FamilyCoin(0));

  /// fromJson
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
