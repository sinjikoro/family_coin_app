import 'package:family_coin/presentation/ui/components/atoms/app_tab_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// タスク一覧画面用タブバー
class TaskTabBar extends StatelessWidget {
  /// コンストラクタ
  const TaskTabBar({
    required this.selectedIndex,
    required this.tabs,
    required this.onTabSelected,
    super.key,
  });

  /// 選択中インデックス
  final int selectedIndex;

  /// タブラベルリスト
  final List<String> tabs;

  /// タブ選択時コールバック
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) => Row(
    children: List.generate(
      tabs.length,
      (i) => Padding(
        padding: EdgeInsets.only(right: i < tabs.length - 1 ? 8 : 0),
        child: AppTabButton(
          label: tabs[i],
          selected: i == selectedIndex,
          onTap: () => onTabSelected(i),
        ),
      ),
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty('selectedIndex', selectedIndex))
      ..add(IterableProperty<String>('tabs', tabs))
      ..add(
        ObjectFlagProperty<ValueChanged<int>>.has(
          'onTabSelected',
          onTabSelected,
        ),
      );
  }
}
