import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 選択肢チップ行（ジェネリック版）
class ChoiceChipRow<T> extends StatelessWidget {

  /// constructor
  const ChoiceChipRow({
    required this.choices, 
    required this.selectedChoice, 
    required this.onSelected, 
    super.key,
    this.spacing = 8,
    this.labelBuilder,
  });
  
  /// インデックス選択ファクトリ
  factory ChoiceChipRow.withIndex({
    required List<T> choices,
    required int selectedIndex,
    required ValueChanged<int> onIndexSelected,
    Key? key,
    double spacing = 8,
    String Function(Object?)? labelBuilder,
  }) {
    return ChoiceChipRow<T>(
      choices: choices,
      selectedChoice: choices.isEmpty ? null : choices[selectedIndex],
      onSelected: (choice) {
        final index = choices.indexOf(choice);
        if (index != -1) onIndexSelected(index);
      },
      key: key,
      spacing: spacing,
      labelBuilder: labelBuilder,
    );
  }

  /// 選択肢リスト
  final List<T> choices;

  /// 選択された選択肢
  final T? selectedChoice;

  /// 選択肢選択コールバック
  final ValueChanged<T> onSelected;

  /// チップ間のスペース
  final double spacing;

  /// ラベル生成関数（デフォルトはtoString()）
  final String Function(Object?)? labelBuilder;

  @override
  Widget build(BuildContext context) => Row(
    children: List.generate(
      choices.length,
      (i) => Padding(
        padding: EdgeInsets.only(right: i < choices.length - 1 ? spacing : 0),
        child: ChoiceChip(
          label: Text(labelBuilder?.call(choices[i]) ?? choices[i].toString()),
          selected: selectedChoice == choices[i],
          onSelected: (_) => onSelected(choices[i]),
        ),
      ),
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<T>('choices', choices))
      ..add(DiagnosticsProperty<T>('selectedChoice', selectedChoice))
      ..add(DoubleProperty('spacing', spacing))
      ..add(ObjectFlagProperty<ValueChanged<T>>.has('onSelected', onSelected))
      ..add(ObjectFlagProperty<String Function(Object?)>.has('labelBuilder', labelBuilder));
  }
}
