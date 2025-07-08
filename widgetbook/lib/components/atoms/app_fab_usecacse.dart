import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_fab.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: AppFab,
  path: WidgetbookRoutePath.atoms,
)
Widget appFabUseCase(BuildContext context) {
  final label = context.knobs.string(
    label: 'Label',
    description: 'FABに表示するラベル',
    initialValue: '新しいタスク',
  );

  final hasCallback = context.knobs.boolean(
    label: 'Has Callback',
    description: 'タップ時のコールバックを有効にする',
    initialValue: true,
  );

  return Center(
    child: AppFab(label: label, onTap: hasCallback ? () {} : null),
  );
}
