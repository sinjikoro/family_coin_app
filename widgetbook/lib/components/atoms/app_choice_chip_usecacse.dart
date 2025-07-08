import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_choice_chip.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Single Choice',
  type: AppChoiceChip,
  path: WidgetbookRoutePath.atoms,
)
Widget singleChoiceUseCase(BuildContext context) {
  return AppChoiceChip(
    label: context.knobs.string(
      label: 'Label',
      description: 'チップに表示するラベル',
      initialValue: 'Single Choice',
    ),
    selected: context.knobs.boolean(
      label: 'Selected',
      description: '選択状態',
      initialValue: false,
    ),
    onSelected: (value) {
      // Widgetbookでは実際の状態変更は行わない
      debugPrint('Selected: $value');
    },
  );
}
