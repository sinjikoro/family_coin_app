import 'package:family_coin/presentation/ui/components/molecules/difficulty_selector.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: DifficultySelector,
  path: WidgetbookRoutePath.molecules,
)
Widget difficultySelectorUseCase(BuildContext context) {
  final difficulties = context.knobs.list(
    label: 'Difficulties',
    description: '難易度の選択肢',
    options: [
      ['かんたん', 'ふつう', 'むずかしい'],
      ['Easy', 'Normal', 'Hard'],
      ['初級', '中級', '上級'],
    ],
    initialOption: ['かんたん', 'ふつう', 'むずかしい'],
  );

  final selectedDifficulty = context.knobs.list(
    label: 'Selected Difficulty',
    description: '選択された難易度',
    options: difficulties,
    initialOption: difficulties[1],
  );

  final hasCallback = context.knobs.boolean(
    label: 'Has Callback',
    description: '選択時のコールバックを有効にする',
    initialValue: true,
  );

  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: DifficultySelector(
        difficulties: difficulties,
        selectedDifficulty: selectedDifficulty,
        onSelected: hasCallback ? (d) {} : (_) {},
      ),
    ),
  );
}
