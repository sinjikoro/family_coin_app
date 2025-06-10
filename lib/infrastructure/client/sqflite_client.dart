import 'package:family_coin/infrastructure/datasource/local_datasource/db_schema/db_schema.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

/// Sqfliteのクライアント
class SqfliteClient {
  /// ファクトリコンストラクタ
  factory SqfliteClient() => _instance;

  /// プライベートコンストラクタ
  SqfliteClient._internal();

  /// シングルトンインスタンス
  static final SqfliteClient _instance = SqfliteClient._internal();

  /// 現在のデータベースバージョン
  static const int _currentVersion = 2;

  Database? _db;
  bool _isInitialized = false;

  /// データベースを取得する
  Future<Database> get db async {
    if (!_isInitialized) {
      _db = await _init();
      _isInitialized = true;
    }
    return _db!;
  }

  /// データベースを初期化する
  Future<Database> _init() async {
    const databaseName = 'family_coin.db';
    final path = '${await getDatabasesPath()}/$databaseName';
    return await openDatabase(
      path,
      version: _currentVersion,
      onCreate: (db, version) async {
        // 初期テーブルを作成
        await _createInitialTables(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        // バージョンに応じたマイグレーションを実行
        await _migrateDatabase(db, oldVersion, newVersion);
      },
    );
  }

  /// 初期テーブルを作成する
  Future<void> _createInitialTables(Database db) async {
    await db.transaction((txn) async {
      await txn.execute(_QueryV1.createUsersTable);
      await txn.execute(_QueryV1.createTasksTable);
      await txn.execute(_QueryV1.createWishitemsTable);
      await txn.execute(_QueryV1.createTransactionLogsTable);
    });
  }

  /// データベースのマイグレーションを実行する
  Future<void> _migrateDatabase(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    // // バージョン1から2へのマイグレーション
    // if (oldVersion < 2) {
    //   await db.transaction((txn) async {
    //     await txn.execute(_QueryV1.createUsersTable);
    //   });
    // }
  }

  /// 新しいテーブルを動的に作成する
  Future<void> createNewTable(String tableName, String createTableQuery) async {
    final database = await db;
    await database.transaction((txn) async {
      await txn.execute(createTableQuery);
    });
  }

  /// データベースを閉じる
  Future<void> close() async {
    if (_db != null) {
      await _db!.close();
      _db = null;
      _isInitialized = false;
    }
  }

  /// アプリのライフサイクルに応じてデータベース接続を管理する
  Future<void> handleAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.paused:
        // アプリが終了またはバックグラウンドに移行する際にデータベースを閉じる
        await close();
      case AppLifecycleState.resumed:
        // アプリが再開された際にデータベース接続を再確立
        if (!_isInitialized) {
          await _init();
        }
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
        break;
    }
  }
}

/// ユーザーテーブル
final String _userTable = DbSchema.user().tableName;

/// タスクテーブル
final String _taskTable = DbSchema.task().tableName;

/// 欲しいものテーブル
final String _wishItemTable = DbSchema.wishItem().tableName;

/// トランザクションログテーブル
final String _transactionLogTable = DbSchema.transactionLog().tableName;

/// ユーザーIDカラム
final String _userIdColumn = DbSchema.user().idColumn;

/// タスクIDカラム
final String _taskIdColumn = DbSchema.task().idColumn;

/// 欲しいものIDカラム
final String _wishItemIdColumn = DbSchema.wishItem().idColumn;

/// トランザクションログIDカラム
final String _transactionLogIdColumn = DbSchema.transactionLog().idColumn;

class _QueryV1 {
  /// ユーザーテーブルを作成する
  static String get createUsersTable => '''
    CREATE TABLE IF NOT EXISTS $_userTable(
      $_userIdColumn INTEGER PRIMARY KEY,
      name TEXT NOT NULL,
      familyCoinBalance INTEGER NOT NULL
    )
  ''';

  /// タスクテーブルを作成する
  static String get createTasksTable => '''
    CREATE TABLE IF NOT EXISTS $_taskTable(
      $_taskIdColumn INTEGER PRIMARY KEY,
      name TEXT NOT NULL,
      $_userIdColumn INTEGER NOT NULL,
      earnCoins INTEGER NOT NULL,
      description TEXT,
      difficulty TEXT
    )
  ''';

  /// ほしいものテーブルを作成する
  static String get createWishitemsTable => '''
    CREATE TABLE IF NOT EXISTS $_wishItemTable(
      $_wishItemIdColumn INTEGER PRIMARY KEY,
      name TEXT NOT NULL,
      $_userIdColumn INTEGER NOT NULL,
      price INTEGER NOT NULL,
      description TEXT,
      url TEXT
    )
  ''';

  /// タスクログテーブルを作成する
  static String get createTransactionLogsTable => '''
    CREATE TABLE IF NOT EXISTS $_transactionLogTable(
      $_transactionLogIdColumn INTEGER PRIMARY KEY,
      $_userIdColumn INTEGER NOT NULL,
      type TEXT NOT NULL,
      amount INTEGER NOT NULL,
      description TEXT,
      createdAt TEXT NOT NULL,
      updatedAt TEXT NOT NULL
    )
  ''';
}
