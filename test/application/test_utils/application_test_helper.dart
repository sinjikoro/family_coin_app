import 'package:family_coin/domain/repository/task_repository.dart';
import 'package:family_coin/domain/repository/transaction_log_repository.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/domain/repository/wishitem_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/test_utils/mocks/mock_task_repository.dart';
import '../../core/test_utils/mocks/mock_transaction_log_repository.dart';
import '../../core/test_utils/mocks/mock_user_repository.dart';
import '../../core/test_utils/mocks/mock_wishitem_repository.dart';

/// アプリケーション層のテストヘルパー
class ApplicationTestHelper {
  /// ProviderContainer
  late ProviderContainer container;

  /// GetItインスタンス
  late GetIt getIt;

  /// テストのセットアップ
  Future<void> setUp() async {
    WidgetsFlutterBinding.ensureInitialized();
    container = ProviderContainer();
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    getIt =
        GetIt.I
          ..registerSingleton<SharedPreferences>(prefs)
          ..registerSingleton<UserRepository>(MockUserRepository())
          ..registerSingleton<TaskRepository>(MockTaskRepository())
          ..registerSingleton<WishitemRepository>(MockWishitemRepository())
          ..registerSingleton<TransactionLogRepository>(
            MockTransactionLogRepository(),
          );
  }

  /// テストのクリーンアップ
  Future<void> tearDown() async {
    container.dispose();
    await getIt.reset();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
