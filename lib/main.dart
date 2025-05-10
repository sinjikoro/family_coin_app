import 'package:family_coin/app.dart';
import 'package:family_coin/core/di/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// アプリケーションのエントリーポイント
void main() async {
  // Flutterのバインディングを初期化
  WidgetsFlutterBinding.ensureInitialized();

  // 依存性注入の初期化
  await DependencyInjection.local();

  // アプリケーションを起動
  runApp(const ProviderScope(child: App()));
}
