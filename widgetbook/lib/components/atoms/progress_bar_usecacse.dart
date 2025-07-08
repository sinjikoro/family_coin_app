import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/progress_bar.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: ProgressBar,
  path: WidgetbookRoutePath.atoms,
)
Widget progressBarInteractiveUseCase(BuildContext context) {
  final progress = context.knobs.double.slider(
    label: 'Progress',
    description: 'プログレスバーの進捗（0.0 - 1.0）',
    min: 0.0,
    max: 1.0,
    divisions: 100,
    initialValue: 0.5,
  );

  return Center(child: ProgressBar(value: progress));
}
