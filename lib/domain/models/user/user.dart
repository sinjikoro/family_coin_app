import 'package:family_coin/domain/value_objects/family_coin.dart';
import 'package:family_coin/domain/value_objects/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// ユーザー
@freezed
abstract class User with _$User {
  /// Constructor
  const factory User({
    @IdJsonConverter() required Id id,
    required String name,
    @FamilyCoinJsonConverter() required FamilyCoin familyCoin,
  }) = _User;

  /// Constructor
  const User._();

  /// fromJson
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
