import 'package:family_coin/presentation/ui/components/molecules/legend_row.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: LegendRow,
  path: WidgetbookRoutePath.molecules,
)
Widget legendRowUseCase(BuildContext context) {
  final legendItems = [
    const LegendItem(
      color: Colors.blue,
      label: '完了',
    ),
    const LegendItem(
      color: Colors.orange,
      label: '未完了',
    ),
    const LegendItem(
      color: Colors.grey,
      label: '休日',
    ),
  ];

  final spacing = context.knobs.double.slider(
    label: 'Spacing',
    description: 'アイテム間のスペース',
    initialValue: 16.0,
    min: 0.0,
    max: 32.0,
  );

  return Center(
    child: LegendRow(
      items: legendItems,
      spacing: spacing,
    ),
  );
}