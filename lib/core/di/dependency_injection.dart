import 'package:family_coin/domain/repository/task_repository.dart';
import 'package:family_coin/domain/repository/transaction_log_repository.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/domain/repository/wishitem_repository.dart';
import 'package:family_coin/infrastructure/client/sqflite_client.dart';
import 'package:family_coin/infrastructure/datasource/local_datasource/task_local_datasource.dart';
import 'package:family_coin/infrastructure/datasource/local_datasource/transaction_log_local_datasource.dart';
import 'package:family_coin/infrastructure/datasource/local_datasource/user_local_datasource.dart';
import 'package:family_coin/infrastructure/datasource/local_datasource/wishitem_local_datasource.dart';
import 'package:family_coin/infrastructure/repository/task_repository_impl.dart';
import 'package:family_coin/infrastructure/repository/transaction_log_repository_impl.dart';
import 'package:family_coin/infrastructure/repository/user_repository_impl.dart';
import 'package:family_coin/infrastructure/repository/wishitem_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 依存性注入の設定
class DependencyInjection {
  static final GetIt _getIt = GetIt.I;

  /// ローカル実行の依存性を設定
  static Future<void> local() async {
    // SharedPreferencesの初期化
    final prefs = await SharedPreferences.getInstance();

    // Sqfliteの初期化
    final sqfliteClient = SqfliteClient();

    // getItへ登録
    _getIt
      ..registerSingleton<SharedPreferences>(prefs)
      // 各種リポジトリの登録
      ..registerSingleton<UserRepository>(
        UserRepositoryImpl(UserLocalDataSource(sqfliteClient)),
      )
      ..registerSingleton<TaskRepository>(
        TaskRepositoryImpl(TaskLocalDataSource(sqfliteClient)),
      )
      ..registerSingleton<TransactionLogRepository>(
        TransactionLogRepositoryImpl(
          TransactionLogLocalDataSource(sqfliteClient),
        ),
      )
      ..registerSingleton<WishitemRepository>(
        WishitemRepositoryImpl(WishitemLocalDataSource(sqfliteClient)),
      );
  }

  /// テスト用に依存性をリセット
  static Future<void> reset() async {
    await _getIt.reset();
  }
}
