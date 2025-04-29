import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';

/// ユーザーモデル
class User {
  /// Constructor
  const User({
    required this.id,
    required this.name,
    required this.familyCoinBalance,
  });

  /// ユーザーID
  final Id id;

  /// ユーザー名
  final String name;

  /// FamilyCoin残高
  final FamilyCoin familyCoinBalance;
}
