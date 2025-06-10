// lib/infrastructure/datasource/local_data_store.dart
import 'package:family_coin/core/exception/exception.dart';
import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/infrastructure/client/sqflite_client.dart';
import 'package:family_coin/infrastructure/datasource/local_datasource/db_schema/db_schema.dart';
import 'package:family_coin/infrastructure/datasource/user_datasource.dart';

/// ローカルデータソース
class UserLocalDataSource implements UserDataSource {
  /// コンストラクタ
  UserLocalDataSource(this._client);

  final SqfliteClient _client;

  final String _usersTable = DbSchema.user().tableName;

  final String _tasksTable = DbSchema.task().tableName;

  final String _wishItemsTable = DbSchema.wishItem().tableName;

  final String _transactionLogsTable = DbSchema.transactionLog().tableName;

  final String _userIdColumn = DbSchema.user().idColumn;

  /// ユーザー情報を取得する
  @override
  Future<User> getUser({required UserId userId}) async {
    final db = await _client.db;
    final result = await db.query(
      _usersTable,
      where: '$_userIdColumn = ?',
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
      where: '$_userIdColumn = ?',
      whereArgs: [userId.value],
    );
  }

  /// ユーザー情報とその関連データを削除する
  @override
  Future<void> deleteUserWithRelatedData({required UserId userId}) async {
    final db = await _client.db;
    await db.transaction((txn) async {
      // タスクを削除
      await txn.delete(
        _tasksTable,
        where: '$_userIdColumn = ?',
        whereArgs: [userId.value],
      );
      // 欲しいものを削除
      await txn.delete(
        _wishItemsTable,
        where: '$_userIdColumn = ?',
        whereArgs: [userId.value],
      );
      // トランザクションログを削除
      await txn.delete(
        _transactionLogsTable,
        where: '$_userIdColumn = ?',
        whereArgs: [userId.value],
      );
      // ユーザーを削除
      await txn.delete(
        _usersTable,
        where: '$_userIdColumn = ?',
        whereArgs: [userId.value],
      );
    });
  }
}
