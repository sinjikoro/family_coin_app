import 'package:family_coin/presentation/ui/components/molecules/achievement_condition_field.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: AchievementConditionField,
  path: WidgetbookRoutePath.molecules,
)
Widget achievementConditionFieldUseCase(BuildContext context) {
  final condition = context.knobs.string(
    label: 'Condition',
    description: '達成条件のテキスト',
    initialValue: '10回タスクを完了する',
  );

  final hasCallback = context.knobs.boolean(
    label: 'Has Callback',
    description: '変更時のコールバックを有効にする',
    initialValue: true,
  );

  return Padding(
    padding: const EdgeInsets.all(16),
    child: AchievementConditionField(
      condition: condition,
      onChanged: hasCallback ? (v) {} : (_) {},
    ),
  );
}
