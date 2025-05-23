import 'package:family_coin/infrastructure/client/sqflite_client.dart';
import 'package:family_coin/presentation/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// アプリケーションルート
class App extends ConsumerStatefulWidget {
  /// constructor
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    // アプリのライフサイクルに応じてデータベース接続を管理する
    await SqfliteClient().handleAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    final GoRouter router = ref.watch(routerProvider);

    return MaterialApp.router(
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      theme: ThemeData(primarySwatch: Colors.indigo),
      routerConfig: router,
      builder:
          (context, child) =>
              Localizations.override(context: context, child: child),
    );
  }
}
