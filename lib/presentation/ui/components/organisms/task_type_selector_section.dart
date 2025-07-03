import 'package:family_coin/presentation/ui/components/molecules/task_type_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// タスク種別セレクターセクション
class TaskTypeSelectorSection extends StatelessWidget {
  /// コンストラクタ
  const TaskTypeSelectorSection({
    required this.selectedIndex,
    required this.onSelected,
    super.key,
  });

  /// 選択されたインデックス
  final int selectedIndex;

  /// 選択されたインデックスを更新するコールバック
  final void Function(int) onSelected;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: TaskTypeCard(
          icon: Icons.emoji_events,
          title: 'チャレンジタスク',
          subTitle: '一度きりの挑戦',
          description: '初めての体験や特別な達成を記録するタスクです。一度達成したら完了となります。',
          selected: selectedIndex == 0,
          onTap: () => onSelected(0),
        ),
      ),
      const SizedBox(width: 16),
      Expanded(
        child: TaskTypeCard(
          icon: Icons.autorenew,
          title: 'コツコツタスク',
          subTitle: '継続的な習慣',
          description: '毎日や定期的に行う習慣的なタスクです。スケジュールを設定して継続的に取り組みます。',
          selected: selectedIndex == 1,
          onTap: () => onSelected(1),
        ),
      ),
    ],
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty('selectedIndex', selectedIndex))
      ..add(
        ObjectFlagProperty<void Function(int p1)>.has('onSelected', onSelected),
      );
  }
}
