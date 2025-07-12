import 'package:family_coin/presentation/ui/components/molecules/choice_chip_row.dart';
import 'package:family_coin/presentation/ui/components/molecules/labeled_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// チャレンジタスク設定セクション
class ChallengeTaskSection extends StatelessWidget {
  /// constructor
  const ChallengeTaskSection({
    required this.difficulties,
    required this.selectedDifficulty,
    required this.condition,
    required this.onDifficultySelected,
    required this.onConditionChanged,
    super.key,
  });

  /// 難易度リスト
  final List<String> difficulties;

  /// 選択された難易度
  final String selectedDifficulty;

  /// 達成条件
  final String condition;

  /// 難易度選択コールバック
  final ValueChanged<String> onDifficultySelected;

  /// 達成条件変更コールバック
  final ValueChanged<String> onConditionChanged;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.orange[50],
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.emoji_events, color: Colors.orange),
            SizedBox(width: 8),
            Text('チャレンジタスク設定', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 8),
        const Text('難易度レベル'),
        ChoiceChipRow(
          choices: difficulties,
          selectedChoice: selectedDifficulty,
          onSelected: onDifficultySelected,
        ),
        const SizedBox(height: 8),
        LabeledTextField(
          label: '達成条件',
          hintText: '10回タスクを完了する',
          onChanged: onConditionChanged,
        ),
      ],
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<String>('difficulties', difficulties))
      ..add(StringProperty('selectedDifficulty', selectedDifficulty))
      ..add(StringProperty('condition', condition))
      ..add(
        ObjectFlagProperty<ValueChanged<String>>.has(
          'onDifficultySelected',
          onDifficultySelected,
        ),
      )
      ..add(
        ObjectFlagProperty<ValueChanged<String>>.has(
          'onConditionChanged',
          onConditionChanged,
        ),
      );
  }
}
