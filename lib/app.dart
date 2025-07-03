import 'package:family_coin/infrastructure/client/sqflite_client.dart';
import 'package:family_coin/presentation/l10n/l10n.dart';
import 'package:family_coin/presentation/routing/router.dart';
import 'package:family_coin/presentation/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final router = ref.watch(routerProvider);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: MaterialApp.router(
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routerConfig: router,
        builder:
            (context, child) =>
                Localizations.override(context: context, child: child),
      ),
    );
  }
}
