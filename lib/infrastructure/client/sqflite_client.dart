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
      await txn.execute(_QueryV1.createTaskLogsTable);
      await txn.execute(_QueryV1.rewardRecordTable);
    });
  }

  /// データベースのマイグレーションを実行する
  Future<void> _migrateDatabase(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    // バージョン1から2へのマイグレーション
    if (oldVersion < 2) {
      await db.transaction((txn) async {
        await txn.execute(_QueryV1.createUsersTable);
        await txn.execute(_QueryV1.createTasksTable);
        await txn.execute(_QueryV1.createWishitemsTable);
        await txn.execute(_QueryV1.createTaskLogsTable);
        await txn.execute(_QueryV1.rewardRecordTable);
      });
    }
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

class _QueryV1 {
  /// ユーザーテーブルを作成する
  static String get createUsersTable => '''
    CREATE TABLE IF NOT EXISTS users(
      id INTEGER PRIMARY KEY,
      name TEXT NOT NULL,
      familyCoinBalance INTEGER NOT NULL
    )
  ''';

  /// タスクテーブルを作成する
  static String get createTasksTable => '''
    CREATE TABLE IF NOT EXISTS tasks(
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
    CREATE TABLE IF NOT EXISTS wishitems(
      id INTEGER PRIMARY KEY,
      name TEXT NOT NULL,
      userId INTEGER NOT NULL,
      approvalStatus TEXT NOT NULL,
      price INTEGER NOT NULL,
      description TEXT,
      url TEXT
    )
  ''';

  /// タスクログテーブルを作成する
  static String get createTaskLogsTable => '''
    CREATE TABLE IF NOT EXISTS task_logs(
      id INTEGER PRIMARY KEY,
      taskId INTEGER NOT NULL,
      userId INTEGER NOT NULL,
      approvalStatus TEXT NOT NULL,
      earnedCoins INTEGER NOT NULL,
      earnedAt TEXT NOT NULL,
      createdAt TEXT NOT NULL,
      updatedAt TEXT NOT NULL
    )
  ''';

  /// ほしいもの交換履歴テーブルを作成する
  static String get rewardRecordTable => '''
    CREATE TABLE IF NOT EXISTS reward_records(
      id INTEGER PRIMARY KEY,
      userId INTEGER NOT NULL,
      wishItemId INTEGER NOT NULL,
      exchangedCoins INTEGER NOT NULL,
      approvalStatus TEXT NOT NULL,
      exchangeAt TEXT NOT NULL,
      createdAt TEXT NOT NULL,
      updatedAt TEXT NOT NULL
    )
  ''';
}
