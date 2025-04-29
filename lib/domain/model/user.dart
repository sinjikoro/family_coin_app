/// ユーザーモデル
class User {
  /// Constructor
  const User({
    required this.id,
    required this.name,
    required this.familyCoinBalance,
  });

  /// ユーザーID
  final String id;

  /// ユーザー名
  final String name;

  /// FamilyCoin残高
  final int familyCoinBalance;
}
