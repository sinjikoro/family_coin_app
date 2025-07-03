import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// コイン数選択
class CoinAmountSelector extends StatelessWidget {
  /// コンストラクタ
  const CoinAmountSelector({
    required this.amounts,
    required this.selectedIndex,
    required this.onSelected,
    super.key,
  });

  /// コイン数選択
  final List<int> amounts;

  /// 選択されたインデックス
  final int selectedIndex;

  /// 選択されたインデックスを更新するコールバック
  final void Function(int) onSelected;

  @override
  Widget build(BuildContext context) => Row(
    children: List.generate(
      amounts.length,
      (i) => Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ChoiceChip(
          label: Text('${amounts[i]}'),
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
      ..add(IterableProperty<int>('amounts', amounts));
  }
}
