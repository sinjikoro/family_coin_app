import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// アイコン選択
class IconChoiceRow extends StatelessWidget {
  /// コンストラクタ
  const IconChoiceRow({
    required this.icons,
    required this.selectedIndex,
    required this.onSelected,
    super.key,
  });

  /// アイコン
  final List<IconData> icons;

  /// 選択されたインデックス
  final int selectedIndex;

  /// 選択されたインデックスを更新するコールバック
  final void Function(int) onSelected;

  @override
  Widget build(BuildContext context) => Row(
    children: List.generate(
      icons.length,
      (i) => Padding(
        padding: const EdgeInsets.only(right: 12),
        child: GestureDetector(
          onTap: () => onSelected(i),
          child: Container(
            decoration: BoxDecoration(
              color: selectedIndex == i ? Colors.yellow[50] : Colors.grey[100],
              border: Border.all(
                color: selectedIndex == i ? Colors.orange : Colors.transparent,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(12),
            child: Icon(icons[i], size: 32, color: Colors.orange),
          ),
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
      ..add(IterableProperty<IconData>('icons', icons));
  }
}
