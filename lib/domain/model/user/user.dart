import 'package:family_coin/domain/value_object/converter/family_coin_json_converter.dart';
import 'package:family_coin/domain/value_object/converter/id_json_converter.dart';
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
    @UserIdJsonConverter() required UserId userId,
    required String name,
    @FamilyCoinJsonConverter() required FamilyCoin familyCoinBalance,
  }) = _User;

  /// Constructor
  const User._();

  /// fromJson
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// コインを利用する
  User useFamilyCoin({required FamilyCoin amount}) =>
      copyWith(familyCoinBalance: familyCoinBalance - amount);

  /// コインを獲得する
  User earnFamilyCoin({required FamilyCoin amount}) =>
      copyWith(familyCoinBalance: familyCoinBalance + amount);
}
