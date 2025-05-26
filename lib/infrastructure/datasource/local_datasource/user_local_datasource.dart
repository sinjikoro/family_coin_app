// lib/infrastructure/datasource/local_data_store.dart
import 'package:family_coin/core/exception/exception.dart';
import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/infrastructure/client/sqflite_client.dart';
import 'package:family_coin/infrastructure/datasource/user_datasource.dart';

/// ローカルデータソース
class UserLocalDataSource implements UserDataSource {
  /// コンストラクタ
  const UserLocalDataSource(this._client);

  final SqfliteClient _client;

  static const _usersTable = 'users';
  static const _idColumn = 'id';

  /// ユーザー情報を取得する
  @override
  Future<User> getUser({required UserId userId}) async {
    final db = await _client.db;
    final result = await db.query(
      _usersTable,
      where: '$_idColumn = ?',
      whereArgs: [userId.value],
    );
    if (result.isEmpty) {
      throw UserNotFoundException();
    }
    return User.fromJson(result.first);
  }

  /// ユーザー情報一覧を取得する
  @override
  Future<List<User>> getUserList() async {
    final db = await _client.db;
    final result = await db.query(_usersTable);
    return result.map(User.fromJson).toList();
  }

  /// ユーザー情報を作成する
  @override
  Future<void> createUser(User user) async {
    final db = await _client.db;
    await db.insert(_usersTable, user.toJson());
  }

  /// ユーザー情報を更新する
  @override
  Future<void> updateUser({required UserId userId, required User user}) async {
    final db = await _client.db;
    await db.update(
      _usersTable,
      user.toJson(),
      where: '$_idColumn = ?',
      whereArgs: [userId.value],
    );
  }

  /// ユーザー情報を削除する
  @override
  Future<void> deleteUser({required UserId userId}) async {
    final db = await _client.db;
    await db.delete(
      _usersTable,
      where: '$_idColumn = ?',
      whereArgs: [userId.value],
    );
  }
}
