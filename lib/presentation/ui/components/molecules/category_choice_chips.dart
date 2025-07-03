import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// カテゴリ選択チップ
class CategoryChoiceChips extends StatelessWidget {
  /// コンストラクタ
  const CategoryChoiceChips({
    required this.categories,
    required this.selectedIndex,
    required this.onSelected,
    super.key,
  });

  /// カテゴリ
  final List<String> categories;

  /// 選択されたインデックス
  final int selectedIndex;

  /// 選択されたインデックスを更新するコールバック
  final void Function(int) onSelected;

  @override
  Widget build(BuildContext context) => Row(
    children: List.generate(
      categories.length,
      (i) => Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ChoiceChip(
          label: Text(categories[i]),
          selected: selectedIndex == i,
          onSelected: (_) => onSelected(i),
        ),
      ),
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty('selectedIndex', selectedIndex))
      ..add(
        ObjectFlagProperty<void Function(int p1)>.has('onSelected', onSelected),
      )
      ..add(IterableProperty<String>('categories', categories));
  }
}
