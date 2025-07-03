import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/molecules/task_tab_bar.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: TaskTabBar)
Widget taskTabBarUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: TaskTabBar(
      selectedIndex: 0,
      tabs: ['今日', '今週', '今月'],
      onTabSelected: (_) {},
    ),
  );
}

@widgetbook.UseCase(name: 'Second Tab Selected', type: TaskTabBar)
Widget taskTabBarSecondSelectedUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: TaskTabBar(
      selectedIndex: 1,
      tabs: ['今日', '今週', '今月'],
      onTabSelected: (_) {},
    ),
  );
}

@widgetbook.UseCase(name: 'With Callback', type: TaskTabBar)
Widget taskTabBarWithCallbackUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: TaskTabBar(
      selectedIndex: 0,
      tabs: ['今日', '今週', '今月'],
      onTabSelected: (index) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Tab $index selected!')));
      },
    ),
  );
}

@widgetbook.UseCase(name: 'Single Tab', type: TaskTabBar)
Widget taskTabBarSingleUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: TaskTabBar(selectedIndex: 0, tabs: ['すべて'], onTabSelected: (_) {}),
  );
}
