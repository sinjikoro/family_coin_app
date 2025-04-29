import 'dart:convert';

import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/infrastructure/client/user/user_client.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// ユーザークライアント
class UserClientLocal extends UserClient {
  /// Constructor
  UserClientLocal() : _prefs = GetIt.I<SharedPreferences>();

  /// シェアドプリファレンス
  final SharedPreferences _prefs;

  /// ユーザーを取得する
  @override
  Future<User> getUser() async {
    final userJson = _prefs.getString('user');
    if (userJson == null) {
      return User.initial();
    }
    return User.fromJson(jsonDecode(userJson));
  }

  /// ユーザーを更新する
  @override
  Future<void> updateUser(User user) async {
    await _prefs.setString('user', jsonEncode(user.toJson()));
  }

  /// ユーザーを削除する
  @override
  Future<void> deleteUser() async {
    await _prefs.remove('user');
  }
}
