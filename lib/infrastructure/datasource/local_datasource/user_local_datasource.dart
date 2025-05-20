// lib/infrastructure/datasource/local_data_store.dart
import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/infrastructure/datasource/user_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// ローカルデータソース
class UserLocalDataSource implements UserDataSource {
  /// コンストラクタ
  const UserLocalDataSource(this._prefs);

  final SharedPreferences _prefs;

  static const _idKey = 'user_id';
  static const _nameKey = 'user_name';
  static const _familyCoinBalanceKey = 'user_familyCoinBalance';

  @override
  Future<User> getUser() async {
    final id = _prefs.getInt(_idKey) != null ? UserId(_prefs.getInt(_idKey)!) : const UserId.unassigned();

    final name = _prefs.getString(_nameKey) ?? '';

    final familyCoinBalance = FamilyCoin(_prefs.getInt(_familyCoinBalanceKey) ?? 0);

    return User(id: id, name: name, familyCoinBalance: familyCoinBalance);
  }

  @override
  Future<void> saveUser(User user) async {
    await _prefs.setInt(_idKey, user.id.value);
    await _prefs.setString(_nameKey, user.name);
    await _prefs.setInt(_familyCoinBalanceKey, user.familyCoinBalance.value);
  }
}
