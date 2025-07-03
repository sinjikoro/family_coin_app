import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_choice_chip.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';

@widgetbook.UseCase(
  name: 'Single Choice',
  type: AppChoiceChip,
  path: WidgetbookRoutePath.atoms,
)
Widget singleChoiceUseCase(BuildContext context) {
  return AppChoiceChip(
    label: 'Single Choice',
    selected: true,
    onSelected: (value) {},
  );
}
