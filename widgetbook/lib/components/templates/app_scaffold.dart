import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// アプリケーションのスカフォールドのモックバージョン（widgetbook用）
class MockAppScaffold extends StatelessWidget {
  const MockAppScaffold({
    super.key,
    required this.child,
    this.selectedIndex = 0,
    this.onDestinationSelected,
  });

  /// 子ウィジェット
  final Widget child;

  /// 選択中のインデックス
  final int selectedIndex;

  /// ナビゲーション選択時のコールバック
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected ?? (_) {},
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'ホーム'),
          NavigationDestination(icon: Icon(Icons.assignment), label: 'タスク'),
          NavigationDestination(
            icon: Icon(Icons.card_giftcard),
            label: '欲しいもの',
          ),
          NavigationDestination(icon: Icon(Icons.person), label: 'アカウント'),
        ],
      ),
    );
  }
}

@widgetbook.UseCase(name: 'Default', type: MockAppScaffold)
Widget appScaffoldUseCase(BuildContext context) {
  return const MockAppScaffold(child: Center(child: Text('App Content')));
}

@widgetbook.UseCase(name: 'Task Tab Selected', type: MockAppScaffold)
Widget appScaffoldTaskTabUseCase(BuildContext context) {
  return const MockAppScaffold(
    selectedIndex: 1,
    child: Center(child: Text('Task Tab Content')),
  );
}

@widgetbook.UseCase(name: 'Wishlist Tab Selected', type: MockAppScaffold)
Widget appScaffoldWishlistTabUseCase(BuildContext context) {
  return const MockAppScaffold(
    selectedIndex: 2,
    child: Center(child: Text('Wishlist Tab Content')),
  );
}

@widgetbook.UseCase(name: 'Account Tab Selected', type: MockAppScaffold)
Widget appScaffoldAccountTabUseCase(BuildContext context) {
  return const MockAppScaffold(
    selectedIndex: 3,
    child: Center(child: Text('Account Tab Content')),
  );
}

@widgetbook.UseCase(name: 'With Navigation Callback', type: MockAppScaffold)
Widget appScaffoldWithCallbackUseCase(BuildContext context) {
  return MockAppScaffold(
    child: const Center(child: Text('App Content with Navigation')),
    onDestinationSelected: (index) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Navigated to tab $index')));
    },
  );
}
