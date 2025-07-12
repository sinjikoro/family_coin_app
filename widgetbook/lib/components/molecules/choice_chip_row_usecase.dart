import 'package:family_coin/presentation/ui/components/molecules/choice_chip_row.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: ChoiceChipRow,
  path: WidgetbookRoutePath.molecules,
)
Widget choiceChipRowUseCase(BuildContext context) {
  final choices = ['選択肢1', '選択肢2', '選択肢3'];
  final selectedChoice = context.knobs.list(
    label: 'Selected Choice',
    description: '選択された選択肢',
    options: choices,
    initialOption: choices.first,
  );

  final spacing = context.knobs.double.slider(
    label: 'Spacing',
    description: 'チップ間のスペース',
    initialValue: 8.0,
    min: 0.0,
    max: 20.0,
  );

  return Center(
    child: ChoiceChipRow(
      choices: choices,
      selectedChoice: selectedChoice,
      spacing: spacing,
      onSelected: (choice) {
        debugPrint('Selected choice: $choice');
      },
    ),
  );
}