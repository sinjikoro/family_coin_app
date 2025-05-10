import 'package:family_coin/presentation/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// アプリケーションルート
class App extends ConsumerWidget {
  /// constructor
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter router = ref.watch(routerProvider);

    return MaterialApp.router(
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      theme: ThemeData(primarySwatch: Colors.indigo),
      routerConfig: router,
      builder: (context, child) => Localizations.override(context: context, child: child),
    );
  }
}
