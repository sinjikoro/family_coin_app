import 'package:sqflite/sqflite.dart';

/// Sqfliteのクライアント
class SqfliteClient {
  Database? _db;

  /// データベースを取得する
  Future<Database> get db async {
    _db ??= await _init();
    return _db!;
  }

  /// データベースを初期化する
  Future<Database> _init() async {
    const databaseName = 'family_coin.db';
    final path = '${await getDatabasesPath()}/$databaseName';
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // テーブルを作成する
        await db.execute(_Query.createTasksTable);
        await db.execute(_Query.createWishitemsTable);
      },
    );
    return _db!;
  }

  /// データベースを閉じる
  Future<void> close() async {
    await _db?.close();
    _db = null;
  }
}

class _Query {
  /// タスクテーブルを作成する
  static String get createTasksTable => '''
    CREATE TABLE tasks(
      id INTEGER PRIMARY KEY,
      name TEXT NOT NULL,
      userId INTEGER NOT NULL,
      earnCoins INTEGER NOT NULL,
      registrationStatus TEXT NOT NULL,
      description TEXT,
      difficulty TEXT
    )
  ''';

  /// ほしいものテーブルを作成する
  static String get createWishitemsTable => '''
    CREATE TABLE wishitems(
      id INTEGER PRIMARY KEY,
      name TEXT NOT NULL,
      userId INTEGER NOT NULL,
      approvalStatus TEXT NOT NULL,
      price INTEGER NOT NULL,
      description TEXT,
      url TEXT
    )
  ''';
}
