import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/infrastructure/client/sqflite_client.dart';
import 'package:family_coin/infrastructure/datasource/local_datasource/db_schema/db_schema.dart';
import 'package:family_coin/infrastructure/datasource/wishitem_datasource.dart';

/// ほしいものローカルデータソース
class WishitemLocalDataSource implements WishitemDataSource {
  /// コンストラクタ
  WishitemLocalDataSource(this._client);

  final SqfliteClient _client;

  final String _wishitemsTable = DbSchema.wishItem().tableName;
  final String _idColumn = DbSchema.wishItem().idColumn;
  final String _userIdColumn = DbSchema.user().idColumn;

  /// ほしいものを取得する
  @override
  Future<Wishitem> getWishitem({required WishitemId wishitemId}) async {
    final db = await _client.db;
    final result = await db.query(
      _wishitemsTable,
      where: '$_idColumn = ?',
      whereArgs: [wishitemId.value],
    );
    if (result.isEmpty) {
      throw Exception('Wishitem not found');
    }
    return Wishitem.fromJson(result.first);
  }

  /// ほしいもの一覧を取得する
  @override
  Future<List<Wishitem>> getWishitemList({required UserId userId}) async {
    final db = await _client.db;
    final result = await db.query(
      _wishitemsTable,
      where: '$_userIdColumn = ?',
      whereArgs: [userId.value],
    );
    return result.map(Wishitem.fromJson).toList();
  }

  /// ほしいものを作成する
  @override
  Future<void> createWishitem(Wishitem wishitem) async {
    final db = await _client.db;
    await db.transaction((txn) async {
      await txn.insert(_wishitemsTable, wishitem.toJson());
    });
  }

  /// ほしいものを更新する
  @override
  Future<void> updateWishitem({required Wishitem wishitem}) async {
    final db = await _client.db;
    await db.transaction((txn) async {
      final updatedCount = await txn.update(
        _wishitemsTable,
        wishitem.toJson(),
        where: '$_idColumn = ?',
        whereArgs: [wishitem.wishItemId.value],
      );
      if (updatedCount == 0) {
        throw Exception('Wishitem not found');
      }
    });
  }

  /// ほしいものを削除する
  @override
  Future<void> deleteWishitem({required WishitemId wishitemId}) async {
    final db = await _client.db;
    await db.transaction((txn) async {
      final deletedCount = await txn.delete(
        _wishitemsTable,
        where: '$_idColumn = ?',
        whereArgs: [wishitemId.value],
      );
      if (deletedCount == 0) {
        throw Exception('Wishitem not found');
      }
    });
  }
}
