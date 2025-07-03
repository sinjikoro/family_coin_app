import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/molecules/difficulty_selector.dart';
import 'package:family_coin/presentation/ui/components/molecules/achievement_condition_field.dart';

/// チャレンジタスク設定セクション
class ChallengeTaskSection extends StatelessWidget {
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

  /// constructor
  const ChallengeTaskSection({
    super.key,
    required this.difficulties,
    required this.selectedDifficulty,
    required this.condition,
    required this.onDifficultySelected,
    required this.onConditionChanged,
  });

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
        Row(
          children: const [
            Icon(Icons.emoji_events, color: Colors.orange),
            SizedBox(width: 8),
            Text(
              'チャレンジタスク設定',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text('難易度レベル'),
        DifficultySelector(
          difficulties: difficulties,
          selectedDifficulty: selectedDifficulty,
          onSelected: onDifficultySelected,
        ),
        const SizedBox(height: 8),
        AchievementConditionField(
          condition: condition,
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
      ..add(StringProperty('condition', condition));
  }
}