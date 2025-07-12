import 'package:family_coin/presentation/ui/components/atoms/app_tab_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// カスタムタブバー
class CustomTabBar extends StatelessWidget {
  /// コンストラクタ
  const CustomTabBar({
    required this.selectedIndex,
    required this.tabs,
    required this.onTabSelected,
    super.key,
    this.spacing = 8,
  });

  /// 選択中インデックス
  final int selectedIndex;

  /// タブラベルリスト
  final List<String> tabs;

  /// タブ選択時コールバック
  final ValueChanged<int> onTabSelected;

  /// タブ間のスペース
  final double spacing;

  @override
  Widget build(BuildContext context) => Row(
    children: List.generate(
      tabs.length,
      (i) => Padding(
        padding: EdgeInsets.only(right: i < tabs.length - 1 ? spacing : 0),
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
      ..add(DoubleProperty('spacing', spacing))
      ..add(
        ObjectFlagProperty<ValueChanged<int>>.has(
          'onTabSelected',
          onTabSelected,
        ),
      );
  }
}
