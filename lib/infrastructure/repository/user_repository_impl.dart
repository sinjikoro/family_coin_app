import 'package:family_coin/domain/model/user.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// UserRepositoryの実装
class UserRepositoryImpl implements UserRepository {
  /// Constructor
  const UserRepositoryImpl(this._prefs);

  static const _userIdKey = 'user_id';
  static const _userNameKey = 'user_name';
  static const _userCoinBalanceKey = 'user_coin_balance';

  final SharedPreferences _prefs;

  /// ユーザーを取得する
  @override
  Future<User> getUser() async {
    final id = _prefs.getString(_userIdKey) ?? '';
    final name = _prefs.getString(_userNameKey) ?? '';
    final coinBalance = _prefs.getInt(_userCoinBalanceKey) ?? 0;

    return User(id: id, name: name, familyCoinBalance: coinBalance);
  }

  /// ユーザーを保存する
  @override
  Future<void> saveUser(User user) async {
    await _prefs.setString(_userIdKey, user.id);
    await _prefs.setString(_userNameKey, user.name);
    await _prefs.setInt(_userCoinBalanceKey, user.familyCoinBalance);
  }
}
