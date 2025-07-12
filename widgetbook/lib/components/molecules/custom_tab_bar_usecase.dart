import 'package:family_coin/presentation/ui/components/molecules/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: CustomTabBar,
  path: WidgetbookRoutePath.molecules,
)
Widget customTabBarUseCase(BuildContext context) {
  final tabs = ['タブ1', 'タブ2', 'タブ3'];
  final selectedIndex = context.knobs.int.slider(
    label: 'Selected Index',
    description: '選択中のタブインデックス',
    initialValue: 0,
    min: 0,
    max: tabs.length - 1,
  );

  final spacing = context.knobs.double.slider(
    label: 'Spacing',
    description: 'タブ間のスペース',
    initialValue: 8.0,
    min: 0.0,
    max: 20.0,
  );

  return Center(
    child: CustomTabBar(
      selectedIndex: selectedIndex,
      tabs: tabs,
      spacing: spacing,
      onTabSelected: (index) {
        debugPrint('Selected tab: ${tabs[index]}');
      },
    ),
  );
}