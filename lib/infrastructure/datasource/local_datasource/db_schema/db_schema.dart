/// データベースのスキーマ
abstract class DbSchema {
  /// ユーザーのデータベーススキーマ
  factory DbSchema.user() => UserDbSchema();

  /// タスクのデータベーススキーマ
  factory DbSchema.task() => TaskDbSchema();

  /// 欲しいもののデータベーススキーマ
  factory DbSchema.wishItem() => WishItemDbSchema();

  /// トランザクションログのデータベーススキーマ
  factory DbSchema.transactionLog() => TransactionLogDbSchema();

  /// テーブル名
  final String tableName = throw UnimplementedError();

  /// IDカラム名
  final String idColumn = throw UnimplementedError();
}

/// ユーザーのデータベーススキーマ
class UserDbSchema implements DbSchema {
  @override
  final String tableName = 'users';

  @override
  final String idColumn = 'userId';
}

/// タスクのデータベーススキーマ
class TaskDbSchema implements DbSchema {
  @override
  final String tableName = 'tasks';

  @override
  final String idColumn = 'taskId';
}

/// 欲しいもののデータベーススキーマ
class WishItemDbSchema implements DbSchema {
  @override
  final String tableName = 'wishitems';

  @override
  final String idColumn = 'wishItemId';
}

/// トランザクションログのデータベーススキーマ
class TransactionLogDbSchema implements DbSchema {
  @override
  final String tableName = 'transactionLogs';

  @override
  final String idColumn = 'transactionLogId';
}
