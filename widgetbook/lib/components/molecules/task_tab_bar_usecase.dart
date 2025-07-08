import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/molecules/task_tab_bar.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: TaskTabBar,
  path: WidgetbookRoutePath.molecules,
)
Widget taskTabBarUseCase(BuildContext context) {
  final tabs = context.knobs.list<List<String>>(
    label: 'Tabs',
    description: 'タブの選択肢',
    options: [
      ['今日', '今週', '今月'],
      ['すべて'],
      ['日', '週', '月', '年'],
    ],
    initialOption: ['今日', '今週', '今月'],
  );

  final selectedIndex = context.knobs.int.slider(
    label: 'Selected Index',
    description: '選択されたタブのインデックス',
    min: 0,
    max: 2,
    divisions: 2,
    initialValue: 0,
  );

  final hasCallback = context.knobs.boolean(
    label: 'Has Callback',
    description: 'タブ選択時のコールバックを有効にする',
    initialValue: true,
  );

  return Padding(
    padding: const EdgeInsets.all(16),
    child: TaskTabBar(
      selectedIndex: selectedIndex,
      tabs: tabs,
      onTabSelected: hasCallback
          ? (index) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Tab $index selected!')));
            }
          : (_) {},
    ),
  );
}
