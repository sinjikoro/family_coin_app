import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/molecules/progress_summary_card.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: ProgressSummaryCard,
  path: WidgetbookRoutePath.molecules,
)
Widget progressSummaryCardUseCase(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    description: 'カードのタイトル',
    initialValue: '完了',
  );

  final valueText = context.knobs.string(
    label: 'Value Text',
    description: '値のテキスト',
    initialValue: '3タスク',
  );

  final subText = context.knobs.string(
    label: 'Sub Text',
    description: 'サブテキスト',
    initialValue: '130コイン獲得',
  );

  final color = context.knobs.color(
    label: 'Color',
    description: 'カードの色',
    initialValue: Colors.green,
  );

  return Padding(
    padding: const EdgeInsets.all(16),
    child: ProgressSummaryCard(
      title: title,
      valueText: valueText,
      subText: subText,
      color: color,
    ),
  );
}
