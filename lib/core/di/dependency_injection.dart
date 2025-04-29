import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 依存性注入の設定
class DependencyInjection {
  static final GetIt _getIt = GetIt.I;

  /// 依存性を初期化
  static Future<void> initialize() async {
    // SharedPreferencesの初期化
    final prefs = await SharedPreferences.getInstance();
    _getIt.registerSingleton<SharedPreferences>(prefs);

    // 他の依存関係もここに追加
  }

  /// テスト用に依存性をリセット
  static Future<void> reset() async {
    await _getIt.reset();
  }
}
