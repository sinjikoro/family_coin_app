import 'package:family_coin/presentation/routing/bottom_navigation_items.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// アプリケーションのスカフォールド
class AppScaffold extends StatelessWidget {
  /// コンストラクタ
  const AppScaffold({required this.child, super.key});

  /// 子ウィジェット
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).matchedLocation;

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: BottomNavigationItem.values.indexWhere(
          (item) => item.path == currentPath,
        ),
        onDestinationSelected: (index) {
          final item = BottomNavigationItem.values[index];
          context.go(item.path);
        },
        destinations:
            BottomNavigationItem.values
                .map(
                  (item) => NavigationDestination(
                    icon: Icon(item.icon),
                    label: item.label,
                  ),
                )
                .toList(),
      ),
    );
  }
}
