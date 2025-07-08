import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 難易度選択ウィジェット
class DifficultySelector extends StatelessWidget {

  /// constructor
  const DifficultySelector({
    required this.difficulties, required this.selectedDifficulty, required this.onSelected, super.key,
  });
  /// 難易度リスト
  final List<String> difficulties;

  /// 選択された難易度
  final String selectedDifficulty;

  /// 難易度選択コールバック
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) => Row(
    children: List.generate(
      difficulties.length,
      (i) => Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ChoiceChip(
          label: Text(difficulties[i]),
          selected: selectedDifficulty == difficulties[i],
          onSelected: (_) => onSelected(difficulties[i]),
        ),
      ),
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<String>('difficulties', difficulties))
      ..add(StringProperty('selectedDifficulty', selectedDifficulty));
      properties.add(ObjectFlagProperty<ValueChanged<String>>.has('onSelected', onSelected));
  }
}