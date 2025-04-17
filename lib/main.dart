import 'package:family_coin/presentation/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}

/// アプリケーションルート
class App extends ConsumerWidget {
  /// constructor
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Family Coin',
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
      routerConfig: router,
    );
  }
}
